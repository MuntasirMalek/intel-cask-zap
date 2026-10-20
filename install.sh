#!/usr/bin/env bash
set -e

echo "🚀 Installing intel-cask (cask & zap) to /usr/local/bin..."
sudo mkdir -p /usr/local/bin /usr/local/Caskroom
sudo chown -R "$(whoami):admin" /usr/local/bin /usr/local/Caskroom

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "$SCRIPT_DIR/bin/cask" && -f "$SCRIPT_DIR/bin/zap" ]]; then
    cp "$SCRIPT_DIR/bin/cask" /usr/local/bin/cask
    cp "$SCRIPT_DIR/bin/zap" /usr/local/bin/zap
else
    REPO_URL="${INTEL_CASK_REPO:-https://raw.githubusercontent.com/MuntasirMalek/intel-cask-zap/main}"
    curl -fsSL "$REPO_URL/bin/cask" -o /usr/local/bin/cask
    curl -fsSL "$REPO_URL/bin/zap" -o /usr/local/bin/zap
fi

chmod +x /usr/local/bin/cask /usr/local/bin/zap
echo "✅ Installed /usr/local/bin/cask and /usr/local/bin/zap!"
echo "👉 Run 'cask --help' or 'cask install vlc' to get started."
