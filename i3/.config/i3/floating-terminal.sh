#!/usr/bin/env sh
RUNNING=$(ps -aux | grep -c floating-terminal)
HAS_HIDDEN=$(i3-msg -t get_workspaces | grep hidden-terminal)
ACTIVE_WORKSPACE=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).name')
if [ $RUNNING -gt 3 ]; then
    if [ -n "$HAS_HIDDEN" ]; then
        i3-msg [class="floating-terminal"] move container to workspace $ACTIVE_WORKSPACE
        i3-msg focus mode_toggle
    else
        i3-msg [class="floating-terminal"] move container to workspace hidden-terminal
    fi
else
    kitty --class "floating-terminal"
fi
