#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <strategy-name>"
  echo "Example: $0 build-the-future-now-ghcp"
  exit 1
fi

STRATEGY_NAME=$1
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo ".")
TARGET_DIR="$REPO_ROOT/strategy/$STRATEGY_NAME"

if [ -d "$TARGET_DIR" ]; then
  echo "Error: Strategy '$STRATEGY_NAME' already exists."
  exit 1
fi

echo "Creating strategy '$STRATEGY_NAME'..."
mkdir -p "$TARGET_DIR/context/meeting-notes"

cat <<EOF > "$TARGET_DIR/context/index.md"
# $STRATEGY_NAME

## Overview


## Why It Matters


## Operating Rhythm


## Cross-Customer Impact


## Status
- **Active/Inactive:**
- **Lead:**
- **Your role:**
EOF

cat <<EOF > "$TARGET_DIR/context/personas.md"
# $STRATEGY_NAME — Personas

## Program Lead


## Key Participants


## Your Position

EOF

echo "Success! Created $TARGET_DIR"
echo "Next steps:"
echo "1. Edit $TARGET_DIR/context/index.md"
echo "2. Update personas.md"
