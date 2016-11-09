function tab.guake -a cdto cmd
  guake --new-tab="$cdto" --execute-command="$cmd"
end
