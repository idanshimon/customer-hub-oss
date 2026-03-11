#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <community-name>"
  echo "Example: $0 octopilot-team"
  exit 1
fi

COMMUNITY_NAME=$1
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo ".")
TARGET_DIR="$REPO_ROOT/community/$COMMUNITY_NAME"

if [ -d "$TARGET_DIR" ]; then
  echo "Error: Community '$COMMUNITY_NAME' already exists."
  exit 1
fi

echo "Creating community '$COMMUNITY_NAME'..."
mkdir -p "$TARGET_DIR/context/meeting-notes"

cat <<EOF > "$TARGET_DIR/context/index.md"
# $COMMUNITY_NAME

## Overview


## Members


## What We Share


## Status
- **Active/Inactive:**
- **Your role:**
EOF

cat <<EOF > "$TARGET_DIR/context/personas.md"
# $COMMUNITY_NAME — Personas

## Members


## Your Position

EOF

echo "Success! Created $TARGET_DIR"
echo "Next steps:"
echo "1. Edit $TARGET_DIR/context/index.md"
echo "2. Update personas.md"
