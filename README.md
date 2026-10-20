# intel-cask-zap: Homebrew-Free Cask & Zap CLI for Intel Macs

![macOS Intel](https://img.shields.io/badge/macOS-Intel%20x86__64-000000?logo=apple)
![Python 3](https://img.shields.io/badge/Python-3.8%2B%20(macOS%20Built--in)-3776AB?logo=python&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

With Homebrew 7.0.0 dropping Intel macOS bottle CI and recommending MacPorts for Intel Macs, users have a CLI solution with MacPorts but lose `brew install --cask` and `brew uninstall --zap` for GUI applications.

`intel-cask-zap` solves this with two zero-dependency standalone commands—`cask` and `zap`—that query the Homebrew Cask JSON API directly using macOS built-in `/usr/bin/python3`, automatically selecting Intel binaries without installing Homebrew.

## Features

- 100% Homebrew-Free: Built-in Python 3 and native macOS tools.
- Architecture Resolver: Automatically selects Intel/Universal packages.
- Format Support: Handles DMG, PKG, ZIP, TAR, redirect URLs, and raw binaries.
- Auto CLI Symlinking: Links app CLI binaries to `/usr/local/bin`.
- Quarantine Strip: Removes Gatekeeper quarantine attributes (`xattr -cr`).
- Complete Zap Uninstaller: Cleans apps, launchctl services, pkgutil receipts, and `~/Library` caches.

## Quick Install

    git clone https://github.com/MuntasirMalek/intel-cask-zap.git
    cd intel-cask-zap
    ./install.sh

## Usage

    # Install GUI apps
    cask install google-chrome vlc visual-studio-code

    # Inspect Cask details and Intel download URL
    cask info visual-studio-code

    # List tracked casks
    cask list

    # Upgrade all tracked casks
    cask upgrade-all

    # Deep uninstall app and all cache/preference files
    zap google-chrome

## Recommended Companion: MacPorts for CLI Formulae

    sudo port selfupdate && sudo port upgrade outdated && sudo port reclaim
    sudo port install git curl wget vim zsh ffmpeg yt-dlp gallery-dl nodejs22 npm10

## License

Released under the MIT License.
