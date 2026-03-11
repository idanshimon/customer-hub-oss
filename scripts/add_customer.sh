#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <customer-name>"
  exit 1
fi

CUSTOMER_NAME=$1
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo ".")
TARGET_DIR="$REPO_ROOT/cust/$CUSTOMER_NAME"
SAMPLE_DIR="$REPO_ROOT/cust/sample-customer"

if [ -d "$TARGET_DIR" ]; then
  echo "Error: Customer '$CUSTOMER_NAME' already exists."
  exit 1
fi

echo "Creating customer '$CUSTOMER_NAME'..."
mkdir -p "$TARGET_DIR"
cp -R "$SAMPLE_DIR/context" "$TARGET_DIR/"

# Clean up the copied meeting notes, keep only README
# We want to remove the sample meeting note but keep the directory structure and README
find "$TARGET_DIR/context/meeting-notes" -type f -name "*.md" ! -name "README.md" -delete

echo "Success! Created $TARGET_DIR"
echo "Next steps:"
echo "1. Edit $TARGET_DIR/context/index.md"
echo "2. Update personas, architecture, and opp-history."
