#!/bin/bash
i3-resurrect restore -w 4
sleep 0.2
i3-msg [workspace=4] move workspace to output DP-4
sleep 0.2

i3-resurrect restore -w 2
sleep 0.2
i3-msg [workspace=2] move workspace to output DP-2
sleep 0.2

i3-resurrect restore -w 3
sleep 0.2

i3-resurrect restore -w 1
sleep 0.2

i3-resurrect restore -w 5
sleep 0.2
i3-msg [workspace=5] move workspace to output DP-4
sleep 0.2

i3-resurrect restore -w 8
sleep 0.2

i3-resurrect restore -w 9
sleep 0.2

i3-resurrect restore -w 10
sleep 0.2

