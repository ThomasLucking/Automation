for dir in ~/Desktop/*/; do
  if [ -d "$dir/.git" ]; then
    name=$(basename "$dir")
    echo "=== $name ==="

    # Check for uncommitted changes
    changes=$(git -C "$dir" status --short)
    if [ -n "$changes" ]; then
      echo "Uncommitted changes:"
      echo "$changes" | sed 's/^/      /'
    else
      echo "  ✅ Working tree clean"
    fi

    # Check for unpushed commits
    unpushed=$(git -C "$dir" log @{u}..HEAD --oneline 2>/dev/null)
    if [ $? -ne 0 ]; then
      echo "No upstream set (never pushed)"
    elif [ -n "$unpushed" ]; then
      echo "Unpushed commits:"
      echo "$unpushed" | sed 's/^/      /'
    else
      echo "Fully synced with remote"
    fi

    echo ""
  fi
done
