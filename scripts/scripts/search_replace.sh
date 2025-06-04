#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <directory> <old_word> <new_word>"
    exit 1
fi

# Assign command line arguments to variables
DIRECTORY="$1"
OLD_WORD="$2"
NEW_WORD="$3"

# Escape special characters in old_word and new_word
OLD_WORD_ESCAPED=$(printf '%s\n' "$OLD_WORD" | sed 's/[\/&]/\\&/g')
NEW_WORD_ESCAPED=$(printf '%s\n' "$NEW_WORD" | sed 's/[\/&]/\\&/g')

# Function to replace words in a file and count replacements
replace_words_in_file() {
    local file="$1"
    local temp_file=$(mktemp)  # Create a temporary file for counting
    local count

    # Detect OS and use appropriate sed syntax
    if [[ "$OSTYPE" == "darwin"* ]]; then
        count=$(sed -E "s/$OLD_WORD_ESCAPED/$NEW_WORD_ESCAPED/g" "$file" | tee "$temp_file" | grep -o "$NEW_WORD_ESCAPED" | wc -l)
        mv "$temp_file" "$file"
    else
        count=$(sed -E "s/$OLD_WORD_ESCAPED/$NEW_WORD_ESCAPED/g" "$file" | tee "$temp_file" | grep -o "$NEW_WORD_ESCAPED" | wc -l)
        mv "$temp_file" "$file"
    fi

    echo "Replaced $count occurrences in $file"
    TOTAL_REPLACEMENTS=$((TOTAL_REPLACEMENTS + count))
}

# Find and process each file
find "$DIRECTORY" -type f \( -name "*.jsx" -o -name "*.tsx" -o -name "*.html" -o -name "*.ts" \) | while read -r file; do
    replace_words_in_file "$file"
done

echo "Word replacements complete. All files in $DIRECTORY have been processed."
