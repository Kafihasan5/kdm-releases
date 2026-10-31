#!/bin/sh
# Installs Quantum Download Manager into /Applications.
set -eu
case "$(uname -m)" in
    arm64) arch=arm64 ;;
    *) arch=intel ;;
esac
dir=$(mktemp -d)
curl -fL --progress-bar -o "$dir/app.zip" \
    "https://github.com/Kafihasan5/kdm-releases/releases/latest/download/QuantumDM-mac-$arch.zip"
ditto -x -k "$dir/app.zip" "$dir"
rm -rf "/Applications/Quantum Download Manager.app"
mv "$dir/Quantum Download Manager.app" /Applications/
rm -rf "$dir"
open "/Applications/Quantum Download Manager.app"
