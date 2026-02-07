#!/bin/bash

# select and store word from clipboard 
word=${1:-$(wl-paste --primary --no-newline 2>/dev/null)}

# Check for empty word or special characters
[[ -z "$word" || "$word" =~ [\/] ]] && notify-send -h string:bgcolor:#bf616a -t 3000 "Invalid input." && exit 0

query=$(curl -s --connect-timeout 5 --max-time 10 "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")

# Check for connection error 
[ $? -ne 0 ] && notify-send -h string:bgcolor:#bf616a -t 3000 "Connection error." && exit 1

# Check for invalid word response
[[ "$query" == *"No Definitions Found"* ]] && notify-send -h string:bgcolor:#bf616a -t 3000 "Invalid word." && exit 0

# Show only first 3 definitions
def=$(echo "$query" | jq -r '[.[].meanings[] | {pos: .partOfSpeech, def: .definitions[].definition}] | .[:3].[] | "\n\(.pos). \(.def)"')

notify-send -t 60000 "$word -" "$def"


# Show first definition for each part of speech
# def=$(echo "$query" | jq -r '.[0].meanings[] | "\(.partOfSpeech): \(.definitions[0].definition)\n"')

# Show all definitions
# def=$(echo "$query" | jq -r '.[].meanings[] | "\n\(.partOfSpeech). \(.definitions[].definition)"')




