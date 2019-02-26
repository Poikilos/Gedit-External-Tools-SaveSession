#!/bin/sh
tools_path="$HOME/.config/gedit/tools"
if [ ! -d "$tools_path" ]; then mkdir -p "$tools_path"; fi
if [ ! -f session-save ]; then
  echo "ERROR: Nothing done since install must be run from the gedit-sessionsaver repository folder where it is located"
  sleep 2
  exit 1
fi
cp -f "$tools_path/session-save" ./
cp -f "$tools_path/session-save-as" ./
cp -f "$tools_path/session-restore" ./

