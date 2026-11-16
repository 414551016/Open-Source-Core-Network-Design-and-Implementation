#!/usr/bin/env bash
set -euo pipefail
# Run inside the packet-analysis container with the evidence folder mounted at /evidence.
out=/evidence
export DISPLAY=:91
Xvfb "$DISPLAY" -screen 0 1210x560x24 &
xvfb=$!
trap 'kill "$xvfb" 2>/dev/null || true' EXIT
sleep 1

for mode in single dual; do
    for endpoint in ue upf; do
        capture="$mode-$endpoint.pcap"
        filter='icmp && ip.addr == 1.1.1.1'
        if [ "$endpoint" = upf ]; then
            filter="$filter && gtp"
        fi
        table="$out/$mode-$endpoint.txt"
        {
            printf 'Project 3 | %s RAN | %s capture\n' "$mode" "${endpoint^^}"
            printf 'Source file: %s    Decoder: TShark\n' "$capture"
            printf 'Display filter: %s\n\n' "$filter"
            printf '%-6s %-31s %-31s %-13s %s\n' 'Frame' 'Source IPv4' 'Destination IPv4' 'ICMP' 'TEID'
            tshark -n -r "$out/$capture" -Y "$filter" -T fields \
                -e frame.number -e ip.src -e ip.dst -e icmp.type -e gtp.teid 2>/dev/null |
                awk -F '\t' '!seen[$2 FS $3 FS $4 FS $5]++ {
                    type = ($4 == 8 ? "Echo request" : ($4 == 0 ? "Echo reply" : $4))
                    printf "%-6s %-31s %-31s %-13s %s\n", $1, $2, $3, type, $5
                }'
            if [ "$endpoint" = upf ]; then
                printf '\nComma-separated IPv4 values show the outer N3 address first, then the inner IP.\n'
            fi
        } > "$table"
        test "$(wc -l < "$table")" -ge 9
        xterm -fullscreen -geometry 116x27+0+0 -fa 'DejaVu Sans Mono' -fs 13 \
            -bg '#101827' -fg '#edf3fd' -T "Project 3 — $capture" \
            -e bash -c 'cat "$1"; sleep 20' _ "$table" &
        terminal=$!
        sleep 1
        scrot -o "$out/$mode-$endpoint.png"
        kill "$terminal"
        wait "$terminal" 2>/dev/null || true
    done
done
