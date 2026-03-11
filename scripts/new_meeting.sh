#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <customer-name> \"<YYYY-MM-DD>\" \"<short-topic>\""
  exit 1
fi

CUSTOMER_NAME=$1
DATE=$2
TOPIC=$3
SAFE_TOPIC=$(echo "$TOPIC" | tr ' ' '-')
FILENAME="${DATE}_${SAFE_TOPIC}.md"

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo ".")

# Check community/ first, then strategy/, then cust/
if [ -d "$REPO_ROOT/community/$CUSTOMER_NAME/context" ]; then
  CUSTOMER_DIR="$REPO_ROOT/community/$CUSTOMER_NAME/context"
elif [ -d "$REPO_ROOT/strategy/$CUSTOMER_NAME/context" ]; then
  CUSTOMER_DIR="$REPO_ROOT/strategy/$CUSTOMER_NAME/context"
elif [ -d "$REPO_ROOT/cust/$CUSTOMER_NAME/context" ]; then
  CUSTOMER_DIR="$REPO_ROOT/cust/$CUSTOMER_NAME/context"
else
  CUSTOMER_DIR="$REPO_ROOT/cust/$CUSTOMER_NAME/context"
fi
MEETING_DIR="$CUSTOMER_DIR/meeting-notes"
FILE_PATH="$MEETING_DIR/$FILENAME"

if [ ! -d "$CUSTOMER_DIR" ]; then
  echo "Error: Customer '$CUSTOMER_NAME' not found at $CUSTOMER_DIR"
  exit 1
fi

mkdir -p "$MEETING_DIR"

cat <<EOF > "$FILE_PATH"
---
date: $DATE
customer: $CUSTOMER_NAME
topic: $TOPIC
tags:
  - meeting
---

# $TOPIC

## Objective


## Key Discussion Points


## Decisions


## Risks


## Action Items


## Follow-Up

EOF

# Update index.md
INDEX_FILE="$CUSTOMER_DIR/index.md"
if [ -f "$INDEX_FILE" ]; then
  # Insert link after "## Recent Meeting Notes"
  # Using sed to find the line and append after it.
  # macOS sed requires empty string for -i extension
  sed -i '' "/## Recent Meeting Notes/a\\
- [$DATE $TOPIC](meeting-notes/$FILENAME)\\
" "$INDEX_FILE"
else
  echo "Warning: index.md not found, skipping link update."
fi

echo "Success! Created meeting note: $FILE_PATH"
