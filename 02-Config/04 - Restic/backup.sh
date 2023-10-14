#!/bin/bash
set -e # Abort if there is an issue with any build.

# Usage:
# ./backup.sh

# Load the file with the common variables.
. $(dirname "$0")/variables.sh

# The folders that will be backed up.
folder1="/Users/$USER/Desktop"
folder2="/Users/$USER/Documents"
folder3="/Users/$USER/Downloads"
folder4="/Users/$USER/Music/Luciano"
folder5="/Users/$USER/Pictures"
folder6="/Users/$USER/Luciano"

backup() {
  echo "Starting the backup of $1"

  restic --repo "$1" --verbose --tag "$2" backup ${@:3} --password-command="$passwordCommand"

  echo -e
}

backup $repository "$(date +%B)" $folder1 $folder2 $folder3 $folder4 $folder5 $folder6
