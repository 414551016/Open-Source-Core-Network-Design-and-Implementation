"""Run the official grader and preserve both sets of closed packet captures."""
import ctypes
import os
from pathlib import Path
import shutil
import struct
import subprocess
from threading import Thread

root = Path.cwd()
captures = root / "pcap"
captures.mkdir(exist_ok=True)
evidence = root.parent / "evidence"
evidence.mkdir(exist_ok=True)
driver = ctypes.CDLL(None, use_errno=True)
fd = driver.inotify_init1(os.O_CLOEXEC)
if fd < 0 or driver.inotify_add_watch(fd, os.fsencode(captures), 0x8) < 0:
    raise OSError(ctypes.get_errno(), "unable to observe packet captures")
header = struct.Struct("iIII")
counts = {}

def preserve_captures():
    while True:
        data = os.read(fd, 16384)
        offset = 0
        while offset < len(data):
            _, _, _, size = header.unpack_from(data, offset)
            offset += header.size
            name = data[offset:offset + size].split(b"\0", 1)[0].decode()
            offset += size
            if name not in ("ue.pcap", "upf.pcap"):
                continue
            count = counts.get(name, 0)
            counts[name] = count + 1
            if count < 2:
                mode = ("single", "dual")[count]
                shutil.copyfile(captures / name, evidence / f"{mode}-{name}")

Thread(target=preserve_captures, daemon=True).start()
with (evidence / "grade.log").open("w", encoding="utf-8") as log:
    with subprocess.Popen(["bash", "grade.sh"], cwd=root / "test", stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, text=True, errors="replace", bufsize=1) as proc:
        for line in proc.stdout:
            print(line, end="", flush=True)
            log.write(line)
            log.flush()
        raise SystemExit(proc.wait())
