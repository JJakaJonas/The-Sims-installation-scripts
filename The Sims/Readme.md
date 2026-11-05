# The Sims 1 Universal Automated Installer

A robust, automated deployment tool designed to seamlessly install **The Sims 1** (Base Game + All 8 Expansion Packs) across systems ranging from **Windows XP to Windows 11** (supporting both 32-bit and 64-bit architectures). 

This project automates registry key injection, sequential installation execution, No-CD patching, widescreen resolution tweaking, and desktop shortcut creation.

---

## 📂 Project Structure

```text
TheSims1-Installer/
│
├── XP-Installer.cmd       # One-click loader with auto-UAC elevation & XP checks
├── Installer.ps1          # Main PowerShell automation script
├── Serials.txt            # External configuration file for CD/registration keys
│
├── BaseGame/              # Base game installation folder (contains Setup.exe)
├── LivinLarge/            # Expansion pack folders (contain Start.exe)
├── HouseParty/
├── HotDate/
├── Vacation/
├── Unleashed/
├── Superstar/
├── MakinMagic/
│
└── fix/                   # Contains the No-CD patched executable (Sims.exe)
```

---

## ⚙️ Features & What It Does

1. **Smart OS & Architecture Detection:** Automatically detects whether you are running legacy Windows XP or modern Windows (10/11) and targets the correct registry hives (`Wow6432Node` on 64-bit systems).
2. **One-Click Elevation:** The `.cmd` loader automatically requests Administrator privileges (UAC prompt) so you don't have to worry about permission errors.
3. **Registry Injection:** Reads your CD keys from `Serials.txt` and automatically injects them into the Windows Registry under the correct Maxis registry subpaths before installation begins.
4. **Sequential Installer Queue:** Automatically runs `Setup.exe` for the base game and `Start.exe` for each expansion pack in the correct chronological order, waiting for each installation to finish before proceeding.
5. **No-CD Patching:** Automatically backs up the original executable (`Sims.old`) and replaces it with the No-CD patched `Sims.exe` from the `fix/` folder.
6. **Widescreen Force:** Automatically writes `ScreenW` (1920) and `ScreenH` (1080) DWord values to the registry for modern widescreen display support.
7. **Desktop Shortcut:** Generates a clean desktop shortcut pointing directly to the game executable with the correct working directory.

---

## 📦 Where to Get Game Files

To run this automated installer, you need the original installation files for *The Sims 1* (Base Game and expansions)

* **Own the physical discs?** You can copy the contents of each disc directly into their respective folders (`BaseGame`, `LivinLarge`, etc.).
* **Don't have the discs?** You can download a complete, pre-organized collection of the game files and necessary patches directly from the public archive I've hosted on [Archive.org] https://archive.org/download/the-sims-games-collection/The%20Sims.7z

## 🚀 How to Use

### 1. Prepare your Files
Ensure your folder structure matches the layout above, with your game installation files placed inside their respective subfolders (`BaseGame`, `LivinLarge`, etc.), and your No-CD `Sims.exe` placed inside the `fix/` folder.

### 2. Configure `Serials.txt`
Create a file named `Serials.txt` in the root directory alongside the scripts. Format your registration keys like this:

```ini
BaseGame=XXXX-XXXX-XXXX-XXXX-XXXX
LivinLarge=XXXX-XXXX-XXXX-XXXX-XXXX
HouseParty=XXXX-XXXX-XXXX-XXXX-XXXX
HotDate=XXXX-XXXX-XXXX-XXXX-XXXX
Vacation=XXXX-XXXX-XXXX-XXXX-XXXX
Unleashed=XXXX-XXXX-XXXX-XXXX-XXXX
Superstar=XXXX-XXXX-XXXX-XXXX-XXXX
MakinMagic=XXXX-XXXX-XXXX-XXXX-XXXX
```

### 3. Run the Installer
Simply **double-click `installer.ps1`**. 
Or XP-Install.cmd on Windows XP
* The script will request administrator rights automatically.
* Follow the on-screen prompts for each installation dialog. Once finished, your game will be fully patched, configured for widescreen, and ready to play!

---

## 🛠️ Requirements
* Windows XP up to Windows 11.
* Windows PowerShell (built into modern Windows; supported via .NET / PowerShell 2.0 on Windows XP).