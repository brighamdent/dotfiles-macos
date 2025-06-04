#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <word_to_delete>"
    exit 1
fi

# Assign command line arguments to variables
DIRECTORY="$1"
WORD_TO_DELETE="$2"

# Escape special characters in WORD_TO_DELETE
WORD_ESCAPED=$(printf '%s\n' "$WORD_TO_DELETE" | sed 's/[\/&]/\\&/g')

# Function to remove the word from a file
remove_word_in_file() {
    local file="$1"

    # Detect OS and use appropriate sed syntax
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i "" "s/$WORD_ESCAPED//g" "$file"
    else
        sed -i "s/$WORD_ESCAPED//g" "$file"
    fi

    echo "Processed: $file"
}

# Find and process each file
find "$DIRECTORY" -type f \( -name "*.jsx" -o -name "*.tsx" -o -name "*.html" -o -name "*.ts" \) | while read -r file; do
    remove_word_in_file "$file"
done

echo "Word removal complete. All files in $DIRECTORY have been processed."
