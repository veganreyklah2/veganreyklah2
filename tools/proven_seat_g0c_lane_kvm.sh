#!/usr/bin/env bash
# proven_seat_g0c_lane_kvm.sh — in-lane G0-complete (counsel 20260712.090512).
#
# Requires lane_kvm on + /dev/kvm. Shape:
#   -accel kvm -cpu host -machine q35 -m 4G
#   -display none  (VGA kept; QMP screendump)
#   -nic none      (until a worded networking need)
# Serial floor: GRUB loading. Glass: non-empty PNG via QMP screendump.
#
#   ./tools/run_with_lane_kvm.sh -- ./tools/proven_seat_g0c_lane_kvm.sh
#   rishi/bin/rishi run tools/proven_seat_g0_complete_jailed.rish

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

"$REPO_ROOT/tools/lane_kvm.sh" assert-on

CACHE="$REPO_ROOT/tools/.cache/proven-seat"
IMG="$CACHE/sculpt-26-04.img"
WORK="$CACHE/sculpt-g0c-lane-work.img"
LOG="$CACHE/g0c-lane-serial.log"
PNG="$CACHE/g0c-lane-screendump.png"
QMP="$CACHE/g0c-lane-qmp.sock"
META="$CACHE/g0c-lane-meta.txt"
EXPECTED="241b916ab9e3ed25a089c27119aac98f80fe4d3e67101936b4e69d7f1c708f14"

mkdir -p "$CACHE"
: >"$META"
date -Is | tee -a "$META"

if [ ! -f "$IMG" ]; then
  echo "RED: missing $IMG" | tee -a "$META" >&2
  exit 1
fi
hash="$(sha256sum "$IMG" | cut -d' ' -f1)"
if [ "$hash" != "$EXPECTED" ]; then
  echo "RED: sha256 mismatch want $EXPECTED got $hash" | tee -a "$META" >&2
  exit 1
fi

cp -f "$IMG" "$WORK"
rm -f "$LOG" "$PNG" "$QMP"

qemu-system-x86_64 \
  -accel kvm -cpu host -machine q35 -m 4G \
  -drive "format=raw,file=${WORK}" \
  -nic none \
  -boot order=c \
  -display none \
  -serial "file:${LOG}" \
  -qmp "unix:${QMP},server,nowait" \
  >>"$META" 2>&1 &
QPID=$!

cleanup() {
  if kill -0 "$QPID" 2>/dev/null; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT

echo "qemu_pid=$QPID" | tee -a "$META"

# Wait for QMP socket, then GRUB on serial (up to ~120s).
ready=0
for _ in $(seq 1 60); do
  if [ -S "$QMP" ]; then
    ready=1
    break
  fi
  sleep 1
done
if [ "$ready" -ne 1 ]; then
  echo "RED: QMP socket never appeared" | tee -a "$META" >&2
  exit 1
fi

grub=0
for _ in $(seq 1 60); do
  if [ -f "$LOG" ] && rg -q 'GRUB loading' "$LOG" 2>/dev/null; then
    grub=1
    break
  fi
  sleep 2
done
if [ "$grub" -ne 1 ]; then
  echo "RED: serial never reached GRUB loading — see $LOG" | tee -a "$META" >&2
  exit 1
fi
echo "serial_floor=GRUB" | tee -a "$META"

# QMP screendump via Python (unix socket; no socat required).
python3 - "$QMP" "$PNG" <<'PY'
import json, socket, sys, time

qmp_path, png_path = sys.argv[1], sys.argv[2]
sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
sock.settimeout(30)
sock.connect(qmp_path)

def recv_obj():
    buf = b""
    while True:
        chunk = sock.recv(4096)
        if not chunk:
            raise RuntimeError("QMP closed")
        buf += chunk
        if b"\n" in buf:
            line, buf = buf.split(b"\n", 1)
            return json.loads(line.decode())

def send(obj):
    sock.sendall((json.dumps(obj) + "\n").encode())

# Greeting
recv_obj()
send({"execute": "qmp_capabilities"})
recv_obj()
send({"execute": "screendump", "arguments": {"filename": png_path}})
# Allow an event before the return
deadline = time.time() + 20
got = False
while time.time() < deadline:
    msg = recv_obj()
    if msg.get("return") is not None or "error" in msg:
        if "error" in msg:
            raise RuntimeError(msg["error"])
        got = True
        break
if not got:
    raise RuntimeError("screendump timed out")
sock.close()
print("screendump_ok", png_path)
PY

if [ ! -s "$PNG" ]; then
  echo "RED: empty or missing screendump $PNG" | tee -a "$META" >&2
  exit 1
fi
bytes="$(wc -c <"$PNG" | tr -d ' \n')"
echo "glass_bytes=$bytes" | tee -a "$META"
echo "GREEN: proven-seat G0-complete (lane_kvm) — GRUB serial + QMP PNG ($bytes bytes); -display none -nic none"
