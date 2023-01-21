#!/bin/bash
i3-resurrect restore -w 1
i3-msg [workspace=1] move workspace to output DP-2

i3-resurrect restore -w 2
i3-msg [workspace=2] move workspace to output DP-2

i3-resurrect restore -w 3
i3-msg [workspace=3] move workspace to output DP-2

i3-resurrect restore -w 4
i3-msg [workspace=4] move workspace to output DP-4

i3-resurrect restore -w 8
i3-msg [workspace=8] move workspace to output DP-4

i3-resurrect restore -w 9
i3-msg [workspace=9] move workspace to output DP-4

i3-resurrect restore -w 10
i3-msg [workspace=10] move workspace to output DP-4

