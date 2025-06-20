# 🛠 Keyboard Double Typing Fix – AutoHotkey v2

## Problem

Some keyboards — especially wireless or mechanical ones like the **Logitech G613** — suffer from **double typing**, where a single keypress is registered multiple times (e.g., `TTthis iiissue`). This script solves the problem by **blocking repeated keystrokes within a configurable delay window**.

---

## Features

- ⏱️ **Per-key delay** to prevent accidental double inputs (default: 90ms)
- 🔠 Supports proper uppercase behavior with **Shift** and **Caps Lock**
- 🔁 **Toggle on/off** at any time using **Ctrl+H**
- 🔧 Clean implementation in **AutoHotkey v2**
- 🎮 Won’t interfere with games if you disable it manually

---

## How to Use

1. **Install AutoHotkey v2**: [Download here](https://www.autohotkey.com/)
2. Save the script as `DoubleTypingFix.ahk`
3. Run the script (Right-click → “Run Script” or double-click)
4. Use **Ctrl + H** to toggle the script on or off
5. *(Optional)* To run on startup:
   - Press `Win + R`, type `shell:startup` and hit Enter
   - Copy or link the script to that folder

---

## Notes

- The script only affects **visible typing keys** (letters, numbers, symbols).
- It **does not block** Ctrl, Alt, Enter, Shift, etc.
- Safe to run in the background — toggle it off manually before gaming.

---

## License

MIT – use freely, at your own risk.
