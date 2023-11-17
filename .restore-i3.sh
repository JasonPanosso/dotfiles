#!/bin/bash
i3-resurrect restore -w 4
sleep 0.2

i3-resurrect restore -w 10
sleep 0.2

i3-resurrect restore -w 3
sleep 0.2
i3-msg move workspace to output next
sleep 0.2

i3-resurrect restore -w 1
