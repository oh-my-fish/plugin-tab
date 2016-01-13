function tab.apple_terminal -a cdto cmd
  osascript 2>/dev/null -e "
    tell application \"Terminal\"
      activate
      tell application \"System Events\" to keystroke \"t\" using command down
      repeat while contents of selected tab of window 1 starts with linefeed
        delay 0.01
      end repeat
      do script \"cd \\\"$cdto\\\"$cmd\" in window 1
    end tell
  "
end
