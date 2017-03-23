function tab.iterm_legacy -a cdto cmd
  set -l profile "Default Session"
  if set -q tab_iterm_profile
    set profile $tab_iterm_profile
  end

  osascript 2>/dev/null -e "
    tell application \"iTerm\"
      tell current terminal
        launch session \"$profile\"
        tell the last session
          write text \"cd \\\"$cdto\\\"$cmd\"
        end tell
      end tell
    end tell
  "
end
