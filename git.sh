#!/bin/bash

PS3="What type of commit is this? "

select commitType in feat fix style docs
do
    echo "Selected: $commitType"
    break
done

read -p = "What will be your commit message" Message

# git commands
branch=$(git branch --show-current)
git add .
git commit -m "$commitType: $Message"
git push origin $branch
