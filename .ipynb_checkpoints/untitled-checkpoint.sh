#!/bin/bash

# Loop through all Jupyter Notebook files
for file in *.ipynb; do
    # Get the file creation date (Linux)
    created_date=$(stat --format='%y' "$file")
    
    # If using macOS, use this instead:
    # created_date=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$file")

    # Add the file to Git
    git add "$file"
    
    # Commit with the extracted creation date
    GIT_COMMITTER_DATE="$created_date" git commit --date="$created_date" -m "Added $file with original creation date"
done

# Push to the remote repository
git push origin main
