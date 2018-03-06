function tab.yakuake -a cdto cmd
  qdbus org.kde.yakuake /yakuake/sessions addSession

  if test -n "$cdto"
    qdbus org.kde.yakuake /yakuake/sessions runCommand "cd $cdto"
  end

  if test -n "$cmd"
    qdbus org.kde.yakuake /yakuake/sessions runCommand "$cmd"
  end
end
