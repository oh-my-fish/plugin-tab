function tab.terminator -a cdto cmd
  terminator --new-tab --working-directory "$cdto" --execute "$cmd"
end
