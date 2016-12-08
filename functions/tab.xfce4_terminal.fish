function tab.xfce4_terminal -a cdto cmd
  xfce4-terminal --tab --working-directory "$cdto" -e "fish -c '$cmd; exec fish'"
end
