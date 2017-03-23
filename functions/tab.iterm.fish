function tab.iterm -a cdto cmd
  set -l profile "default profile"
  if set -q tab_iterm_profile
    set profile "profile \"$tab_iterm_profile\""
  end

  osascript 2>/dev/null -e "
    tell application \"iTerm\"
      tell current window
        set newTab to (create tab with $profile)
        tell current session of newTab
          write text \"cd \\\"$cdto\\\"$cmd\"
        end tell
      end tell
    end tell
  "
end
