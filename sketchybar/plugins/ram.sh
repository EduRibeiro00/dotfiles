#!/bin/bash

RAM_TOTAL=$(sysctl -n hw.memsize | awk '{printf "%.0f", $1/1024/1024/1024}')
RAM_USED=$(vm_stat | awk '
  /Pages active/      { active=$3 }
  /Pages wired/       { wired=$4 }
  /Pages compressed/  { compressed=$3 }
  END { printf "%.1f", (active+wired+compressed)*4096/1024/1024/1024 }
')

RAM_PERCENT=$(echo "$RAM_USED $RAM_TOTAL" | awk '{printf "%.0f", ($1/$2)*100}')

sketchybar --set $NAME label="${RAM_USED}GB/${RAM_TOTAL}GB (${RAM_PERCENT}%)"