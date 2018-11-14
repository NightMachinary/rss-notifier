#!/usr/bin/env zsh
rsstail -l -u "$1" -n 5 | while read -r line1
do
    read -r line2
    if ggrep --silent "$2" <<< "$line1" ; then
        # Use sth like parallel  --null -N 2 tsend me \"{1} $'\n' {2}\"
        local c="printf '%b' $line1'\0'$line2|$3"
        # printf "$c"
        eval "$c"
    fi
done
