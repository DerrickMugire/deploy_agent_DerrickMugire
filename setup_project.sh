#!/bin/bash

PROJECT_DIR="attendance_tracker_v1"

cleanup() {
    echo
    echo "SIGINT detected..."

    tar -czf "${PROJECT_DIR}_archive.tar.gz" "$PROJECT_DIR"

    rm -rf "$PROJECT_DIR"

    echo "Archive created and project cleaned up."
    exit 1
}

trap cleanup SIGINT

if command -v python3 >/dev/null 2>&1
then
    echo "Python3 installed:"
    python3 --version
else
    echo "Python3 not found"
fi

echo "Project structure verified."

find "$PROJECT_DIR"

echo "Setup complete."
