#!/bin/bash

# Check  service exists
service_exists() {
    systemctl list-unit-files --type=service | grep -q "^$1"
}

# Check service is running
is_running() {
    systemctl is-active --quiet "$1"
}

# Start service if not running
start_if_not_running() {
    local service=$1

    if ! service_exists "$service"; then
        echo "Service $service does not exist."
        return 1
    fi

    if is_running "$service"; then
        echo "[✔] $service is already running."
    else
        echo "[⚠] $service is not running. Attempting to start..."
        if sudo systemctl start "$service"; then
            echo "[✔] $service started successfully."
        else
            echo "[❌] Failed to start $service."
        fi
    fi
}

# Stop a service if running
stop_if_running() {
    local service=$1

    if is_running "$service"; then
        echo "$service is running. Stopping..."
        sudo systemctl stop "$service"
        if is_running "$service"; then
            echo "Failed to stop $service."
        else
            echo "$service stopped successfully."
        fi
    else
        echo "$service is not running."
    fi
}

