#!/bin/bash

# Run linting
echo "Running bun lint..."
bun lint
if [ $? -ne 0 ]; then
    echo "❌ Linting errors found. Please fix them before committing."
    exit 1
fi

# Check for changes
if git diff --quiet && git diff --staged --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
    echo "✅ Nothing to commit, working tree clean. Everything is up-to-date."
    echo "✅ Local and remote branches are in sync. No new changes pushed."
    exit 0
fi

# Add changes
git add .

# Prompt for commit type
echo "Select commit type:"
options=("feat" "fix" "chore" "docs" "style" "refactor" "test" "perf" "ci" "build" "revert")
select type in "${options[@]}"; do
    if [[ -n "$type" ]]; then
        break
    fi
    echo "Invalid selection. Try again."
done

# Prompt for scope (optional)
read -p "Enter scope (optional, press Enter to skip): " scope
if [[ -n "$scope" ]]; then
    scope="($scope)"
fi

# Prompt for commit message
read -p "Enter commit message: " message

# Construct final commit message
commit_message="$type$scope: $message"

# Commit and push
git commit -m "$commit_message"
git push

# Check if there were actual changes to push
if [ $? -eq 0 ]; then
    echo "✅ Changes committed and pushed successfully!"
else
    echo "❌ No changes were pushed."
fi
