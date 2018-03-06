function tab.yakuake.split -a cdto cmd
  qdbus org.kde.yakuake /yakuake/sessions splitSessionLeftRight $KONSOLE_DBUS_SESSION

  if test -n "$cdto"
    qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION runCommand "cd $cdto"
  end
   
  if test -n "$cmd"
    qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION runCommand "$cmd"
  end   
end
