#!/bin/bash

STATE_FILE="/tmp/sketchybar_network"

# Service order is priority order, so a wired link wins over Wi-Fi when both are up
while IFS='|' read -r PORT DEV; do
  case "$PORT" in
    Wi-Fi|*Ethernet*|*LAN*) ;;
    *) continue ;;
  esac
  if ifconfig "$DEV" 2>/dev/null | grep -q 'inet '; then
    ACTIVE_DEV="$DEV"
    ACTIVE_PORT="$PORT"
    break
  fi
done < <(networksetup -listnetworkserviceorder | sed -n 's/^ *(Hardware Port: \(.*\), Device: \(.*\))$/\1|\2/p')

if [ -z "$ACTIVE_DEV" ]; then
  rm -f "$STATE_FILE"
  sketchybar --set $NAME icon=󰖪 label="↓ -- ↑ --"
  exit 0
fi

if [ "$ACTIVE_PORT" = "Wi-Fi" ]; then
  ICON=󰖩
else
  ICON=󰈀
fi

read -r RX TX < <(netstat -ib | awk -v dev="$ACTIVE_DEV" '$1 == dev && $3 ~ /^<Link/ { print $(NF-4), $(NF-1); exit }')
# macOS date has no sub-second precision
NOW=$(perl -MTime::HiRes=time -e 'printf "%.3f", time')

PREV_DEV="" PREV_RX=0 PREV_TX=0 PREV_TIME=0
[ -f "$STATE_FILE" ] && read -r PREV_DEV PREV_RX PREV_TX PREV_TIME < "$STATE_FILE"
echo "$ACTIVE_DEV $RX $TX $NOW" > "$STATE_FILE"

# Traffic is bursty, so the window needs to be long enough to avoid flipping between
# Kbps and Mbps. Rates stay 0 on the first sample, after an interface switch, or if
# the counters reset.
IFS='|' read -r DOWN UP < <(awk -v same="$([ "$PREV_DEV" = "$ACTIVE_DEV" ] && echo 1 || echo 0)" \
  -v rx="$RX" -v tx="$TX" -v prx="$PREV_RX" -v ptx="$PREV_TX" -v now="$NOW" -v pt="$PREV_TIME" '
  function fmt(b) {
    bits = b * 8
    if (bits >= 1000000) return sprintf("%.1f Mbps", bits / 1000000)
    if (bits >= 1000) return sprintf("%.0f Kbps", bits / 1000)
    return sprintf("%.0f bps", bits)
  }
  BEGIN {
    dt = now - pt
    if (!same || dt <= 0 || rx < prx || tx < ptx) { rd = 0; td = 0 }
    else { rd = (rx - prx) / dt; td = (tx - ptx) / dt }
    printf "%s|%s", fmt(rd), fmt(td)
  }')

sketchybar --set $NAME icon=$ICON label="↓ $DOWN ↑ $UP"
