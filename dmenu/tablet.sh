xsetwacom list devices | dmenu | sed 's/.*\(id: [0-9]*\).*/\1/g' | sed 's/id: \(.*\)/\1/g' | xargs -I {} xsetwacom set {}
MapToOutput DP-1
