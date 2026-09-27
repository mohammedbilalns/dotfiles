#!/bin/bash

urls=(
  "https://chat.z.ai"
  "https://www.deepseek.com/en"
  "https://gemini.google.com"
  "https://chat.qwen.ai"
  "https://chat.openai.com"
	"https://claude.ai/"
)

BRAVE_PATH="/usr/bin/brave"

if ! command -v brave &> /dev/null; then
    echo "Error: Brave Browser not found. Please install it or update BRAVE_PATH."
    exit 1
fi

"$BRAVE_PATH" --new-window "${urls[@]}" &

disown 
exit 1 

