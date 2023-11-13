#!/bin/bash

# Get the process name of the default image viewer
viewer_process=$(xdg-mime query default image/jpeg)

# Check if the viewer process is running
if pgrep -x "$viewer_process" > /dev/null; then
    # Terminate the viewer process
    pkill -x "$viewer_process"
    echo "Default image viewer closed."
else
    echo "Default image viewer is not currently open."
fi
