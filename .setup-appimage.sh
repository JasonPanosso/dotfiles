#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 path_to_appimage [custom_app_name]"
  exit 1
fi

appimage_path="$1"
appimage_name=$(basename "$appimage_path" .AppImage)
formatted_name=${2:-$appimage_name}

applications=~/.local/share/applications
bin=~/.local/bin

if [ ! -f "$appimage_path" ]; then
  echo "Error: File not found - $appimage_path"
  exit 1
fi

chmod +x "$appimage_path"
new_path="$bin/$appimage_name.AppImage"

if mv "$appimage_path" "$new_path"; then
  echo "AppImage moved to $new_path"
else
  echo "Error: Failed to move AppImage"
  exit 1
fi

desktop_file="$applications/$formatted_name.desktop"

echo -e "[Desktop Entry]\nType=Application\nName=$formatted_name\nExec=$new_path\nIcon=\nCategories=Utility;" > "$desktop_file"

echo "Desktop file created at $desktop_file"
