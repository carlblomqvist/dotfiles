#!/usr/bin/env sh
RUNNING=$(ps -aux | grep -c floating-ranger)
HAS_HIDDEN=$(i3-msg -t get_workspaces | grep hidden-ranger)
ACTIVE_WORKSPACE=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).name')
if [ $RUNNING -gt 3 ]; then
    if [ -n "$HAS_HIDDEN" ]; then
        i3-msg [class="floating-ranger"] move container to workspace $ACTIVE_WORKSPACE
        i3-msg focus mode_toggle
    else
        i3-msg [class="floating-ranger"] move container to workspace hidden-ranger
    fi
else
    kitty --class "floating-ranger" vifmrun
fi
