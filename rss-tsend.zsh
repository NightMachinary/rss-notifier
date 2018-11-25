#!/usr/bin/env zsh
rss-notifier.zsh "$1" "$2"|while read -d "" -r t; do
    read -d "" -r l
    ensure-run.zsh "60s" tsend "${3:-me}" "$t
$l"
done
