#!/usr/bin/env bash

# ===== CONFIG =====
PROFILES_DIR="$HOME/Pocketbook_settings"
DEVICE_MOUNT="/Volumes/POCKETBOOK"
READER_DIR="$DEVICE_MOUNT/system/reader"
# ==================

echo "🔍 Checking for PocketBook device..."
if [ ! -d "$DEVICE_MOUNT" ]; then
  echo "❌ PocketBook not found at $DEVICE_MOUNT"
  echo "   Plug it in and check the volume name in Finder."
  exit 1
fi

if [ ! -d "$READER_DIR" ]; then
  echo "❌ Could not find system/reader on device."
  echo "   Check device mount name or firmware version."
  exit 1
fi

echo
echo "Available profiles:"
echo "  1) Normal"
echo "  2) Kindle"
echo "  3) Kobo"
echo "  4) KOReader"
echo "  5) Restore to Default"
echo
read -rp "Choose profile [1-5]: " CHOICE

case "$CHOICE" in
  1) PROFILE_NAME="Normal"; PREFIX="normal" ;;
  2) PROFILE_NAME="Kindle"; PREFIX="kindle" ;;
  3) PROFILE_NAME="Kobo";   PREFIX="kobo" ;;
  4) PROFILE_NAME="KOReader"; PREFIX="koreader" ;;
  5) PROFILE_NAME="Default_Backup"; PREFIX="default" ;;
  *)
    echo "❌ Invalid choice."
    exit 1
    ;;
esac

PROFILE_DIR="$PROFILES_DIR/$PROFILE_NAME"
LINE_SRC="$PROFILE_DIR/linespacing-$PREFIX.cfg"
MARGIN_SRC="$PROFILE_DIR/margins-$PREFIX.cfg"

# Validate presence of cfg files
if [ ! -f "$LINE_SRC" ]; then
  echo "❌ Missing file: $LINE_SRC"
  exit 1
fi
if [ ! -f "$MARGIN_SRC" ]; then
  echo "❌ Missing file: $MARGIN_SRC"
  exit 1
fi

echo
echo "➡ Applying profile: $PROFILE_NAME"
echo "----------------------------------------"
echo "Source files:"
echo "  $LINE_SRC"
echo "  $MARGIN_SRC"
echo
echo "Destination:"
echo "  $READER_DIR/linespacing.cfg"
echo "  $READER_DIR/margins.cfg"
echo "----------------------------------------"
echo

echo "📄 Copying linespacing file..."
cp "$LINE_SRC" "$READER_DIR/linespacing.cfg"
echo "✔ Copied: $(basename "$LINE_SRC") → linespacing.cfg"

echo "📄 Copying margins file..."
cp "$MARGIN_SRC" "$READER_DIR/margins.cfg"
echo "✔ Copied: $(basename "$MARGIN_SRC") → margins.cfg"

echo
echo "🎉 Profile '$PROFILE_NAME' applied successfully."
echo "ℹ️ Eject and reboot your PocketBook to activate the new settings."
