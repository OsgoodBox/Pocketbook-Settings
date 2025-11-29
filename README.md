# 📘 Pocketbook Settings Profiles
A collection of custom configuration profiles for PocketBook e-readers (ERA, Verse, Touch Lux, InkPad, etc.).
Each profile contains tuned margins.cfg and linespacing.cfg files designed to mimic different reading environments (Kindle, Kobo, KOReader, and a balanced “Normal” preset).

These profiles allow you to swap global PocketBook text rendering styles instantly by replacing the config files in system/reader/.

No firmware modification or third-party tools required.


## 📁 Folder Structure

```
Pocketbook_settings/
├── Default_backup/
│   ├── linespacing-default.cfg
│   └── margins.cfg
│
├── Kindle/
│   ├── linespacing-kindle.cfg
│   └── margins-kindle.cfg
│
├── Kobo/
│   ├── linespacing-kobo.cfg
│   └── margins-kobo.cfg
│
├── KOReader/
│   ├── linespacing-koreader.cfg
│   └── margins-koreader.cfg
│
└── Normal/
    ├── linespacing-normal.cfg
    └── margins-normal.cfg
```    


## 🔤 Fonts are not included.
If you use custom fonts on your PocketBook, install them manually into system/fonts/.

## 📦 Profiles Included

### Normal
Balanced and comfortable.
A clean middle-ground layout between Kindle compactness and Kobo airiness.
Good for general reading and most fonts.

### Kindle
Compact, efficient layout.
Tighter line spacing and margins similar to modern Kindle devices.
Maximizes words per page without looking cramped.

### Kobo
Airy, wide margins and open spacing.
Mimics Kobo’s trade-paperback feel.
Great for serif fonts and relaxed reading.

### KOReader-style
Moderate, flexible spacing.
More open than Normal but less wide than Kobo.
Inspired by KOReader’s most commonly used settings.

### Default_backup
Your original PocketBook config files — use these if you ever need to restore stock behavior.

---
## 🔧 How to Install a Profile
1. Connect your PocketBook to your computer via USB.
2. Open the device’s storage.
3. Navigate to:
```system/reader/
```

4. Backup the existing files (optional but recommended):
```
linespacing.cfg
margins.cfg
```

5. Choose one of the profiles (Normal, Kindle, Kobo, KOReader).
6. Copy that profile’s two .cfg files into:
```
system/reader/
```

7. Rename them to exactly:
```
linespacing.cfg
margins.cfg
```

8. Safely eject the PocketBook.
9. Restart the device.

Your new global reading layout will now be active for all EPUBs.

---

## 🔒 Safe Editing Notes

- PocketBook .cfg files do not support comments (#, //, etc.).
- Do not delete unused keys (e.g., *-panel, *-pager), or the device may revert settings to defaults.
- Percentages (%) represent screen-relative margins/line heights, not CSS units.
- Changes require a device reboot to take effect.

## 🧠 Advanced Notes 
**Why multiple variants (pager, panel, pager-panel)?**
- PocketBook uses several internal renderers.
- Some books or modes trigger alternate render paths; keeping the same values across all variants ensures the layout stays consistent.

**Which profiles work best with which fonts?**
- Kindle: Bookerly, Ember, Roboto, Inter
- Kobo: Noto Serif, Merriweather, Literata, Georgia clones
- Normal: Works with almost any font
- KOReader-style: Fonts with larger x-height (Inter, Atkinson, Lora)

**Do these override book CSS?**
- Yes — margins and line spacing defined here are applied globally by PocketBook’s renderer.
- If a book contains extreme inline CSS, cleaning it in Calibre may still help.