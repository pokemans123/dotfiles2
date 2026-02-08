#!/usr/bin/env bash

word=${1:-$(xclip -o -selection primary)}
query=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")
[ -z "$query" ] && notify-send -h string:bgcolor -t 3000 "Invalid word." && exit 0

def=$(echo "$query" | jq -r '.[0].meanings[] | "')
