function tab.iterm_legacy.splith -a cdto cmd
  osascript 2>/dev/null -e "
    tell application \"iTerm\"
      activate
      tell application \"System Events\" to keystroke \"d\" using {command down, shift down}
      delay 0.2
      tell current terminal
        tell the last session
          write text \"cd \\\"$cdto\\\"$cmd\"
        end tell
      end tell
    end tell
  "
end
