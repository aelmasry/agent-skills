#!/usr/bin/env bash
# Shared platform paths for bootstrap.sh and export.sh
set -euo pipefail

detect_cursor_paths() {
  case "$(uname -s)" in
    Darwin)
      CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"
      KEYBINDINGS_FILE="keybindings.darwin.json"
      PLATFORM="macos"
      ;;
    Linux)
      CURSOR_USER_DIR="$HOME/.config/Cursor/User"
      KEYBINDINGS_FILE="keybindings.linux.json"
      PLATFORM="linux"
      ;;
    MINGW*|MSYS*|CYGWIN*)
      CURSOR_USER_DIR="${APPDATA}/Cursor/User"
      KEYBINDINGS_FILE="keybindings.win32.json"
      PLATFORM="windows"
      ;;
    *)
      echo "Unsupported OS: $(uname -s)" >&2
      echo "Use Git Bash/WSL on Windows, or scripts/bootstrap.ps1 in PowerShell." >&2
      return 1
      ;;
  esac

  CURSOR_DIR="$HOME/.cursor"
  export CURSOR_USER_DIR CURSOR_DIR KEYBINDINGS_FILE PLATFORM
}
