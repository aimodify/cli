#!/bin/bash

#list all keybindings
function gsettings-show-keys{
    gsettings list-recursively  | grep --ignore-case "keys\|hotkey\|keybind"
}
export -f gsettings-show-keys

#get 1 keybinding
gsettings get org.gnome.settings-daemon.plugins.media-keys terminal

#set binding
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal 'F1'

#interactive show key in terminal
xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'

dconf write /org/compiz/profiles/unity/plugins/unityshell/icon-size $1