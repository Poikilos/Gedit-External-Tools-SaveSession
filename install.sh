#!/bin/sh
tools_path="$HOME/.config/gedit/tools"
if [ ! -d "$tools_path" ]; then mkdir -p "$tools_path"; fi
if [ ! -f session-save ]; then
  echo "ERROR: Nothing done since install must be run from the gedit-sessionsaver repository folder where it is located"
  exit 1
fi
if [ -f "$tools_path/restore-session" ]; then
  if [ ! -d rollback ]; then mkdir rollback; fi
  mv -f "$tools_path/restore-session" rollback/
fi
if [ -f "$tools_path/save-session" ]; then
  if [ ! -d rollback ]; then mkdir rollback; fi
  mv -f "$tools_path/save-session" rollback/
fi

for this_name in session-save session-save-as session-restore
do
    if [ -f "$tools_path/$this_name" ]; then
        rm -f "$tools_path/$this_name"
        if [ -f "$tools_path/$this_name" ]; then
            echo "rm -f $tools_path/$this_name  # FAILED to remove old version"
        fi
    fi
    cp -f $this_name "$tools_path/"
    if [ -f "$tools_path/$this_name" ]; then
        echo "# cp -f $this_name $tools_path/$this_name  # OK"
    else
        echo "cp $this_name $tools_path/  # FAILED"
    fi
done
echo "Done."
cat << "END"



* Session Save As:  Ctrl Alt v (make a new session)

* Session Save:     Ctrl Alt s (Save using last saved or loaded session name--has no way to save in RAM, so saves in file--therefore never do Ctrl Alt S when you have opened a second session in another Gedit window)

* Session Restore:  Ctrl Alt e (restore named session by choosing session file from $HOME/.config/Gedit-Sessions

Additional manual step may be required:
- Make sure that you have enabled "External Tools" in Gedit.
If you have, then "Manage External Tools" should be available by
clicking the Menu button. The "Manage External Tools" window should
include the shortcuts above in the list.
- if your operating system allows, you could change Save as to
  Ctrl Alt a and change session restor to Ctrl Alt r. However, these
  shortcuts don't work on Fedora 29 KDE, so the defaults avoid those.


END
