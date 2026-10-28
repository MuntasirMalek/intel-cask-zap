# intel-cask-zap: Homebrew-Free Cask & Formula CLI for Intel Macs

![macOS Intel](https://img.shields.io/badge/macOS-Intel%20x86__64-000000?logo=apple)
![Python 3](https://img.shields.io/badge/Python-3.8%2B%20(macOS%20Built--in)-3776AB?logo=python&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

With Homebrew 7.0.0 dropping Intel macOS bottle CI and recommending MacPorts for Intel Macs, users have a CLI solution with MacPorts but lose `brew install --cask`, `brew uninstall --zap`, and prebuilt Intel CLI formulae that aren't in MacPorts.

`intel-cask-zap` solves this with two zero-dependency standalone commands—`cask` (alias `casks`) and `zap`—that query the Homebrew Cask & Formula JSON APIs and GitHub Releases directly using macOS built-in `/usr/bin/python3`, automatically selecting Intel (`x86_64`) binaries without installing Homebrew.

## Features

- 100% Homebrew-Free: Built-in Python 3 and native macOS tools.
- Casks + CLI Formulae: Installs both GUI Casks (`/Applications`) and CLI Formulae (`/usr/local/bin`) by resolving Intel macOS GitHub Release binaries and Homebrew Intel bottles.
- Smart Name Resolution: Automatically resolves `<name>-desktop` / `<name>-app` variants and direct `owner/repo` GitHub releases.
- Architecture Resolver: Automatically selects Intel (`x86_64`) or Universal packages.
- Smart Install & Skip: Detects and skips already-installed apps/binaries; supports `cask reinstall` and `--force`.
- Format Support: Handles DMG, PKG, ZIP, TAR (`.tar.gz`, `.tar.xz`, `.tar.bz2`), redirect URLs, and raw binaries.
- Auto CLI Symlinking: Links app and formula CLI binaries to `/usr/local/bin`.
- Quarantine Strip: Removes Gatekeeper quarantine attributes (`xattr -cr`).
- Safe & Complete Zap: Closes running apps safely without launching closed apps, then uninstalls files, CLI symlinks, launchctl services, pkgutil receipts, and `~/Library` caches.
- Disk Cleanup: Built-in `cask cleanup` to purge leftover temporary downloads and orphaned caches.

## Quick Install

    git clone https://github.com/MuntasirMalek/intel-cask-zap.git
    cd intel-cask-zap
    ./install.sh

## Usage

    # Install GUI apps (skips if already installed)
    cask install google-chrome vlc visual-studio-code

    # Install CLI Formulae (resolves Intel x86_64 binary from GitHub Releases / Bottles)
    cask install opencode ripgrep gh lazygit fzf uv

    # Install desktop GUI variant explicitly
    cask install opencode-desktop
    cask install --cask opencode

    # Force reinstall apps or CLI tools
    cask reinstall vlc
    cask install --force opencode

    # Inspect Cask or Formula details and Intel download URL
    cask info opencode
    cask info visual-studio-code

    # List tracked packages
    cask list

    # Upgrade all tracked packages
    cask upgrade-all

    # Clean up leftover temporary downloads and orphaned caches
    cask cleanup

    # Deep uninstall app/CLI binary and all cache/preference files
    zap google-chrome
    zap opencode

## Recommended Companion: MacPorts for CLI Formulae

    sudo port selfupdate && sudo port upgrade outdated && sudo port reclaim
    sudo port install git curl wget vim zsh ffmpeg yt-dlp gallery-dl nodejs22 npm10

## License

Released under the MIT License.
