#!/usr/bin/env bash

# Set up the watch
watchman watch ~/projects/taoxyz-wallet

# Set up the trigger
watchman -- trigger ~/projects/taoxyz-wallet build-on-change '**/*' -- \
  bash -c 'echo "=== Rebuilding ==="; bun run build 2>&1 | tee /tmp/build.log'
