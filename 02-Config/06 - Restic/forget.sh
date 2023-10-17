#!/bin/bash
set -e # Abort if there is an issue with any build.

# Usage:
# ./forget.sh

# Load the file with the common variables.
. $(dirname "$0")/variables.sh

forget() {
  echo "Starting the clean up of $1"

  restic --repo "$1" forget --keep-monthly 12 --keep-weekly 4 --keep-daily 5 --keep-hourly 8 --password-command="$passwordCommand"
  restic --repo "$1" prune --password-command="$passwordCommand"

  echo -e
}

forget $repository
