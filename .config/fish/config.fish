if status is-interactive
    # Commands to run in interactive sessions can go here
    export LESS='-eXRF'
    export LC_ALL='en_GB.UTF-8'
    export QT_QPA_PLATFORMTHEME=qt5ct
    abbr -a em emacsclient -c -n
    if not ps ax | grep picom | grep -v grep >/dev/null
        and [ $XDG_CURRENT_DESKTOP != KDE ]   # Plasma has its own compositor.
        picom -f &
    end
end
