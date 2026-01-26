#!/bin/sh
set -e

# Use provided PORT or default to 8080
PORT="${PORT:-8080}"

echo "Updating workspace files..."
cp -r /usr/local/share/workspace/* /home/coder/project/

echo "Starting Autominds IDE on port $PORT..."
exec code-server --bind-addr "0.0.0.0:$PORT" --auth password /home/coder/project
