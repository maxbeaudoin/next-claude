#!/usr/bin/env bash
# PostToolUse hook: runs after Edit or Write
# Receives hook event JSON on stdin.

file=$(jq -r '.tool_input.file_path')

echo "--- format ---"
bun run format "$file"
