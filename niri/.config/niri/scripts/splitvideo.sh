#!/bin/bash

print_usage() {
    echo "Usage: $0 -i input_file -p parts -t timestamp1 timestamp2 ..."
    echo "Example: $0 -i \"video.mp4\" -p 4 -t 00:30:00 01:00:00 01:30:00"
    exit 1
}

INPUT=""
PARTS=0
TIMESTAMPS=()

PARSE_TIMESTAMPS=0

# Argument parsing
while [[ $# -gt 0 ]]; do
    case "$1" in
        -i)
            INPUT="$2"
            shift 2
            ;;
        -p)
            PARTS="$2"
            shift 2
            ;;
        -t)
            PARSE_TIMESTAMPS=1
            shift
            ;;
        -*)
            echo "Unknown option: $1"
            print_usage
            ;;
        *)
            if [[ $PARSE_TIMESTAMPS -eq 1 ]]; then
                TIMESTAMPS+=("$1")
                shift
            else
                echo "Unknown parameter passed: $1"
                print_usage
            fi
            ;;
    esac
done

# Validation
if [[ -z "$INPUT" || "$PARTS" -le 0 ]]; then
    echo "❌ Error: input file (-i) and number of parts (-p) are required."
    print_usage
fi

if [[ ${#TIMESTAMPS[@]} -ne $((PARTS - 1)) ]]; then
    echo "❌ Error: Expected $((PARTS - 1)) timestamps for $PARTS parts, got ${#TIMESTAMPS[@]}"
    print_usage
fi

# Convert time (HH:MM:SS) to seconds
time_to_seconds() {
    IFS=: read -r h m s <<< "$1"
    echo $((10#$h * 3600 + 10#$m * 60 + 10#$s))
}

# Prepare times
STARTS=("00:00:00" "${TIMESTAMPS[@]}")
ENDS=("${TIMESTAMPS[@]}" "end")

# Run split
for i in "${!STARTS[@]}"; do
    START="${STARTS[$i]}"
    END="${ENDS[$i]}"
    OUTPUT="part$((i + 1)).mp4"

    if [[ "$END" == "end" ]]; then
        echo "▶️ $OUTPUT: from $START to end"
        ffmpeg -hide_banner -loglevel error -ss "$START" -i "$INPUT" -c copy "$OUTPUT"
    else
        START_SEC=$(time_to_seconds "$START")
        END_SEC=$(time_to_seconds "$END")
        DURATION=$((END_SEC - START_SEC))
        echo "▶️ $OUTPUT: from $START for $DURATION seconds"
        ffmpeg -hide_banner -loglevel error -ss "$START" -t "$DURATION" -i "$INPUT" -c copy "$OUTPUT"
    fi
done

echo "✅ Done splitting '$INPUT' into $PARTS parts."

