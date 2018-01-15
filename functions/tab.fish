# Open new iTerm, Apple Terminal, Konsole and Gnome Terminal tabs from the command line
#
# USAGE
#
#   tab                     Opens the current directory in a new tab
#   tab [path]              Open PATH in a new tab
#   tab [cmd]               Open a new tab and execute CMD
#   tab [path] [cmd] ...    You can prolly guess
#   tab [-s|--split]        Split the current tab instead of opening a new tab
#   tab [-S|--split-horiz]  Split the current tab horizontally.
#                           (Splits are only supported in iTerm at this time)
#
# If you use iTerm and your default session profile isn't "Default Session",
# override it in your `config.fish` or `omf/init.fish`
#
#     set -g tab_iterm_profile "MyProfile"
#
# AUTHOR
#
#   Justin Hileman (http://justinhileman.com)
#

function tab -d 'Open the current directory (or any other directory) in a new tab'
  set -l cdto $PWD
  set -l cmd

  if test (count $argv) -gt 0
    switch $argv[1]
      case "-s" "--split"
        set split
        set -e argv[1]
      case "-S" "--split-horiz" "--splith" "--split-h" "--split-horizontal" "--split-horizontally"
        set splith
        set -e argv[1]
      case "-h" "--help"
        echo "\
Open new terminal tabs from the command line

Usage:
  tab [options] [dir] [command]

Options:
  -h --help         Display this help message.
  -s --split        Split the current tab instead of opening a new tab.
  -S --split-horiz  Split the current tab horizontally.
                    (Splits are only supported in iTerm at this time)

Arguments:
  dir               Working directory for the new tab [default: pwd]
  command           Command to run in the new tab
"
      return
    end
  end

  if test (count $argv) -gt 0
    if test -d $argv[1]
      pushd . >/dev/null
      cd $argv[1]
      set cdto $PWD
      set -e argv[1]
      popd >/dev/null
    end
  end

  if test (count $argv) -gt 0
    set cmd "; $argv"
  end

  set -l term_program (__tab.term_program)

  switch "$term_program"
    case "iterm"
      if set -q splith
        tab.iterm.splith "$cdto" "$cmd"
      else if set -q split
        tab.iterm.split "$cdto" "$cmd"
      else
        tab.iterm "$cdto" "$cmd"
      end

    case "iterm_legacy"
      if set -q splith
        tab.iterm_legacy.splith "$cdto" "$cmd"
      else if set -q split
        tab.iterm_legacy.split "$cdto" "$cmd"
      else
        tab.iterm_legacy "$cdto" "$cmd"
      end

    case "apple_terminal"
      tab.apple_terminal "$cdto" "$cmd"

    case "konsole"
      tab.konsole "$cdto" "$cmd"

    case "gnome_terminal"
      tab.gnome_terminal "$cdto" "$cmd"

    case "xfce4_terminal"
      tab.xfce4_terminal "$cdto" "$cmd"

    case "guake"
      tab.guake "$cdto" "$cmd"

    case "*"
      echo "Unknown terminal: $term_program" >&2
      return 1
  end
end

function __tab.term_program
  switch "$TERM_PROGRAM"
    case "iTerm.app"
      switch (__tab.iterm_version)
        case "2.9.*" "3.*"
          echo iterm
        case "*"
          echo iterm_legacy
      end

    case "Apple_Terminal"
      echo apple_terminal

    case "*"
      if [ "$KONSOLE_PROFILE_NAME" -o "$KONSOLE_DBUS_SERVICE" -o "$KONSOLE_DBUS_SESSION" -o "$KONSOLE_DBUS_WINDOW" ]
        if [ "$KATE_PID" ]
          echo kate
        else
          echo konsole
        end
      else if [ "$VTE_VERSION" -ge 3803 -o "$COLORTERM" = "gnome-terminal" ]
        echo gnome_terminal
      else if [ "$COLORTERM" = "xfce4-terminal" ]
        echo xfce4_terminal
      else if [ "$GUAKE_TAB_UUID" ]
        echo guake
      end
  end
end

function __tab.iterm_version
  osascript 2>/dev/null -e "get version of application \"iTerm\""
end
