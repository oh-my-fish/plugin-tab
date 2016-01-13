function tab.konsole -a cdto cmd
  konsole --new-tab --workdir "$cdto" -e "$cmd"
end
