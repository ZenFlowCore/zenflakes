#!/usr/bin/env fish

# Set old and new paths
set old "/home/zen/zenflakes/config/quickshell"
set new "/home/zen/zenflakes/config/quickshell"

# Echo for safety
echo "Replacing $old with $new..."

# Recursively replace in text files
# WARNING: This modifies files in-place
for file in (grep -rl -- "$old" .)
    echo "Fixing: $file"
    sed -i "s|$old|$new|g" "$file"
end

echo "Done."

