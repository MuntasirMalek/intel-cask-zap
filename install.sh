#!/usr/bin/env bash
set -e

echo "🚀 Installing intel-cask (cask & zap) to /usr/local/bin..."
TARGET_USER="${SUDO_USER:-$(id -un)}"
sudo mkdir -p /usr/local/bin /usr/local/Caskroom
sudo chown "$TARGET_USER:admin" /usr/local/bin /usr/local/Caskroom

SCRIPT_PATH="${BASH_SOURCE[0]:-}"
SCRIPT_DIR=""
if [[ -n "$SCRIPT_PATH" ]]; then
    SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" 2>/dev/null && pwd || true)"
fi

if [[ -n "$SCRIPT_DIR" && -f "$SCRIPT_DIR/bin/cask" && -f "$SCRIPT_DIR/bin/zap" ]]; then
    rm -f /usr/local/bin/cask /usr/local/bin/zap
    cp "$SCRIPT_DIR/bin/cask" /usr/local/bin/cask
    cp "$SCRIPT_DIR/bin/zap" /usr/local/bin/zap
else
    REPO_URL="${INTEL_CASK_REPO:-https://raw.githubusercontent.com/MuntasirMalek/intel-cask-zap/main}"
    TMP_CASK="$(mktemp /tmp/intel-cask.XXXXXX)"
    TMP_ZAP="$(mktemp /tmp/intel-zap.XXXXXX)"
    trap 'rm -f "$TMP_CASK" "$TMP_ZAP"' EXIT
    curl -fsSL "$REPO_URL/bin/cask" -o "$TMP_CASK"
    curl -fsSL "$REPO_URL/bin/zap" -o "$TMP_ZAP"
    mv -f "$TMP_CASK" /usr/local/bin/cask
    mv -f "$TMP_ZAP" /usr/local/bin/zap
fi

chmod +x /usr/local/bin/cask /usr/local/bin/zap
ln -sf /usr/local/bin/cask /usr/local/bin/casks
chown -h "$TARGET_USER:admin" /usr/local/bin/cask /usr/local/bin/casks /usr/local/bin/zap 2>/dev/null || true
echo "✅ Installed /usr/local/bin/cask (alias: casks) and /usr/local/bin/zap!"
echo "👉 Run 'cask --help' or 'cask install vlc' to get started."
