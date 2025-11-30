# 📘 Pocketbook Settings Profiles
A collection of custom configuration profiles for PocketBook e-readers (ERA, Verse, Touch Lux, InkPad, etc.).
Each profile contains tuned margins.cfg and linespacing.cfg files designed to mimic different reading environments (Kindle, Kobo, KOReader, and a balanced “Normal” preset).

These profiles allow you to swap global PocketBook text rendering styles instantly by replacing the config files in system/reader/.

No firmware modification or third-party tools required.


## 📁 Folder Structure

```
Pocketbook_settings/
│
├── stylesheet.css
├── pb-profile.sh
│
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

---
## 📦 Optional: Install the Profile Switcher Script

If you want to quickly swap between margin/line-spacing profiles without manually copying files each time, you can install an optional macOS helper script.

This script:

- detects your PocketBook automatically
- lets you pick a profile (Normal / Kindle / Kobo / KOReader)
- copies the correct linespacing.cfg and margins.cfg
- renames them automatically for the PocketBook
- and exits cleanly

This is **run on your Mac**, not on the device.

### ⚠️ Important: Edit the Script Paths Before Use

**The script assumes two things**:
- Your PocketBook mounts as `/Volumes/POCKETBOOK`
- Your settings repo lives at `~/Pocketbook_settings`

If either of these paths is different on your system, you must edit the script before running it.

**In the script, look for**:
`PROFILES_DIR="$HOME/Pocketbook_settings"`
`DEVICE_MOUNT="/Volumes/POCKETBOOK"`

and change them accordingly.

**Example**:
If your repo is in: `~/Documents/Pocketbook_settings`

change:
```
PROFILES_DIR="$HOME/Pocketbook_settings"
```

to:
```
PROFILES_DIR="$HOME/Documents/Pocketbook_settings"
```

And if your PocketBook mounts as: `/Volumes/ERA`

change:
```
DEVICE_MOUNT="/Volumes/POCKETBOOK"
```

to:
```
DEVICE_MOUNT="/Volumes/ERA"
```

**❗ Do not skip this step!**

If these paths are wrong:
- the script won’t run
- or worse: it may copy files to the wrong location

### Installation
1. Copy the script into your repo

Save the script from this repo as:
```pb-profile.sh
```

and make it executable:
```chmod +x pb-profile.sh
```

You can run it directly:
```./pb-profile.sh
```

### 🚀 Optional: Install the script system-wide
If you want `pb-profile` available everywhere in Terminal:

2. Move it into /usr/local/bin

```
sudo mv pb-profile.sh /usr/local/bin/pb-profile
sudo chmod +x /usr/local/bin/pb-profile
```

Now you can run:
```
pb-profile
```

from any folder.

### 🔧 Optional: Add to PATH (if /usr/local/bin isn’t detected)
Some macOS setups (especially M1/M2/M3 machines) may not include /usr/local/bin in PATH by default.

Check:
```
echo $PATH
```

If you don’t see `/usr/local/bin`, add it:

For zsh (default macOS shell):
```
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### 🧪 Usage

Plug in your PocketBook (should mount as a volume)

- Run:
```
pb-profile
```

- Choose the profile number
- Eject and reboot the device to apply the new settings

---
## 🎨 Optional: Use stylesheet.css to Fix Badly Formatted EPUBs
Many EPUBs, especially indie releases and older commercial ones, include aggressive CSS that overrides margins, spacing, and line height in ways that make them unreadable on PocketBook.

- To fix this, you can use the provided: `stylesheet.css`

**This file includes clean, minimal typography rules that restore**:
- proper margins
- paragraph spacing
- sensible line height
- no “falling off the edge” text
- consistent indentation
- no forced zero-spacing between paragraphs
- no quirky author-supplied overrides

You apply this per book, inside Calibre.

### 🧼 Fixing EPUB Appearance Using Calibre (Safe Method)
1. Open the book in Calibre’s editor
2. `Right-click the book → Edit Book`

This opens the EPUB contents.

3. Replace the main CSS with your own
	- Find the stylesheet in the left file pane.
		- It’s usually named:
			- `stylesheet.css`
			- `style.css`
			- `styles.css`
			- `book.css`

	- Open it.
	- `Select all`, `copy`, and `paste` the contents of your `stylesheet.css` from this repo.
	- Save.

### 🧹 Optional but recommended: Remove inline <style> tags
A lot of books include chunks of CSS inside the HTML itself, like:
```
<style>
  div#book-inner * {
    margin-top: 0 !important;
    margin-bottom: 0 !important;
  }
</style>
```

These override everything, even good CSS.

To remove them:
1. In the Calibre editor, press
	- Search → Search & Replace (Ctrl+F)
2. In the Search box, choose mode:
	- Regular Expression
	- Use this pattern:
```
<style[\s\S]*?</style>
```

3. Replace with nothing.
4. Press Replace All.
5. Save.

This clears destructive inline CSS while leaving the actual book markup intact.

#### 📍 Finding the First Page of Real Text
Often the first “content page” is buried among title pages and copyright leaves.

To clean up the book and confirm the start of the real content:
1. In the Calibre editor, expand Text on the left.
2. Look for the first file that actually contains chapters or narrative text. Usually named something like:
	- `chapter1.xhtml`
	- `body.xhtml`
	- `section0001.xhtml`

3. Check this file for:
	- inline `<style>` tags
	- custom zero-margin `<p style="...">` blocks
	- weird `<div>` wrappers with forced spacing

4. Remove or normalize these as needed.

#### 🧪 When to Use This Method
Use the stylesheet + cleanup when:
- margins won’t change
- line spacing is stuck
- paragraphs are smashed together
- text sits flush against the bezel
- “all whitespace removed” bugs
- unusual or old EPUB formatting
- KOReader or PocketBook can’t override the CSS
- This restores each book to a clean typographic baseline.