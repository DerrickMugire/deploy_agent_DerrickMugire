# Deploy Agent - Attendance Tracker Project

## Overview
This project is a shell scripting automation tool that generates a structured attendance tracking system. It creates directories, config files, and report logs automatically.

## How to Run

Make script executable:
chmod +x setup_project.sh

Run the script:
./setup_project.sh

You will be prompted to enter a project suffix (e.g. v1).

## Features
- Automatic directory creation
- File copying and organization
- Configuration setup using config.json
- Report logging system
- Input validation using sed
- Signal handling using trap (Ctrl + C cleanup support)

## Archive / Trap Feature
If the script is interrupted using Ctrl + C, the trap function will clean up and prevent incomplete folder structures.

## Author
GitHub Username: DerrickMugire## Video Demonstration
https://www.veed.io/view/d63883a7-c692-44e0-afc7-cc40616955e2?source=editor&panel=share