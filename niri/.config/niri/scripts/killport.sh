#!/bin/bash

# Check if a port number is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <port_number>"
  exit 1
fi

PORT=$1

# Find the process ID (PID) using the specified port
PID=$(lsof -ti tcp:$PORT)

# Check if a process is found
if [ -z "$PID" ]; then
  echo "No process is running on port $PORT"
else
  # Use pkexec to kill the process
  pkexec kill -9 $PID
  if [ $? -eq 0 ]; then
    echo "Process running on port $PORT has been killed."
  else
    echo "Failed to kill the process running on port $PORT."
  fi
fi

