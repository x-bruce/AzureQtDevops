#!/usr/bin/env bash

if [[ -e ../../create-dmg ]]; then
  # We're running from the repo
  CREATE_DMG=../../create-dmg
else
  # We're running from an installation under a prefix
  CREATE_DMG=../../../../bin/create-dmg
fi

# Since create-dmg does not clobber, be sure to delete previous DMG
[[ -f Application-Installer.dmg ]] && rm Application-Installer.dmg

# Create the DMG
$CREATE_DMG \
  --volname "Application Installer" \
  --background "installer_background.png" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "Application.app" 200 190 \
  --hide-extension "Application.app" \
  --app-drop-link 600 185 \
  "Application-Installer.dmg" \
  "source_folder/"