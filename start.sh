#!/bin/sh
set -e

# Use provided PORT or default to 8080
PORT="${PORT:-8080}"

echo "Starting Autominds IDE on port $PORT..."
exec code-server --bind-addr "0.0.0.0:$PORT" --auth password /home/coder/project
