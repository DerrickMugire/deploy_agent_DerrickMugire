#!/bin/bash

# ==============================
# Attendance Tracker - Project Factory
# ==============================

set -e

# ------------------------------
# SIGNAL TRAP (Ctrl + C handling)
# ------------------------------
cleanup() {
    echo ""
    echo "⚠️ Interrupted! Creating backup..."

    archive="attendance_tracker_${project_name}_archive"

    if [ -d "$project_dir" ]; then
        tar -czf "${archive}.tar.gz" "$project_dir"
        rm -rf "$project_dir"
        echo "📦 Archive created: ${archive}.tar.gz"
        echo "🧹 Incomplete directory removed."
    fi

    exit 1
}

trap cleanup SIGINT


# ------------------------------
# USER INPUT
# ------------------------------
read -p "Enter project suffix name: " project_name

project_dir="attendance_tracker_${project_name}"

# ------------------------------
# CREATE STRUCTURE
# ------------------------------
mkdir -p "$project_dir/Helpers"
mkdir -p "$project_dir/reports"


# ------------------------------
# COPY FILES
# ------------------------------
cp attendance_checker.py "$project_dir/"
cp assets.csv "$project_dir/Helpers/"
cp config.json "$project_dir/Helpers/"
cp reports.log "$project_dir/reports/"


# ------------------------------
# HEALTH CHECK
# ------------------------------
echo "Checking Python3..."

if command -v python3 >/dev/null 2>&1; then
    echo "Python3 found:"
    python3 --version
else
    echo "WARNING: Python3 not installed"
fi


# ------------------------------
# CONFIG UPDATE (sed requirement)
# ------------------------------
config_file="$project_dir/Helpers/config.json"

echo ""
read -p "Update thresholds? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then

    read -p "Warning threshold (default 75): " warning
    read -p "Failure threshold (default 50): " failure

    warning=${warning:-75}
    failure=${failure:-50}

    sed -i "s/\"warning\"[[:space:]]*:[[:space:]]*[0-9]\+/\"warning\": $warning/" "$config_file"
    sed -i "s/\"failure\"[[:space:]]*:[[:space:]]*[0-9]\+/\"failure\": $failure/" "$config_file"

    echo "Config updated successfully."
fi


# ------------------------------
# FINAL CHECK
# ------------------------------
echo ""
echo "Project created at:"
find "$project_dir"

echo ""
echo "DONE."
