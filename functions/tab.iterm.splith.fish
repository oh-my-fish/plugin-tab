function tab.iterm.splith -a cdto cmd
  osascript 2>/dev/null -e "
    tell application \"iTerm\"
      tell current session of current tab of current window
        set newSession to (split horizontally with same profile)
        tell newSession
          write text \"cd \\\"$cdto\\\"$cmd\"
        end tell
        tell current tab to select newSession
      end tell
    end tell
  "
end
