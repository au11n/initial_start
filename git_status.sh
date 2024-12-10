#!/bin/bash

# Папка с проектами
projects_dir=~/cod

# Перебор всех подпапок на один уровень глубже
for project in "$projects_dir"/*; do
  if [ -d "$project/.git" ]; then
    echo "Checking Git status in $project..."
    git -C "$project" status
  else
    echo "$project is not a Git repository."
  fi
done
