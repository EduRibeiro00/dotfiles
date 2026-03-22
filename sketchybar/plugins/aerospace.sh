#!/bin/bash

# Fall back to querying aerospace directly if env var is not set
if [ -n "$FOCUSED_WORKSPACE" ]; then
  FOCUSED="$FOCUSED_WORKSPACE"
else
  FOCUSED="$(aerospace list-workspaces --focused)"
fi

THIS="${NAME#space.}"  # strips "space." prefix to get the workspace id

if [ "$THIS" = "$FOCUSED" ]; then
  sketchybar --set $NAME background.color=0x40ffffff
else
  sketchybar --set $NAME background.drawing=off
fi