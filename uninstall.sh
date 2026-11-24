#!/usr/bin/env bash
set -e

if [[ -w /usr/local/bin ]]; then
    rm -f /usr/local/bin/cask /usr/local/bin/casks /usr/local/bin/zap
else
    sudo rm -f /usr/local/bin/cask /usr/local/bin/casks /usr/local/bin/zap
fi
echo "✅ Removed /usr/local/bin/cask, /usr/local/bin/casks, and /usr/local/bin/zap."
