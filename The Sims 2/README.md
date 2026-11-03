<h1>The Sims 2 Complete Collection - Automatic Installer</h1>

<p>This script automates the full installation of The Sims 2 and all its expansions/stuff packs on modern systems. It bypasses expired certificate blocks, handles UAC permissions, applies a widescreen/modern graphics fix, and installs everything in the correct chronological order with a single click.</p>

<h2>Folder Structure</h2>
<p>Your main installation folder must look exactly like this before you run the script:</p>

<pre><code>
The Sims 2 Installation Folder/
│
├── BaseGame/               &lt;-- Installation files (setup.exe)
├── University/             &lt;-- Installation files (setup.exe)
├── Nightlife/              &lt;-- Installation files (setup.exe)
├── ChristmasStuff/         &lt;-- Installation files (setup.exe)
│   └── ... (and so on for all expansion/stuff pack folders)
│
├── Content/
│   └── EA Games/           &lt;-- Store content to be copied to Documents
│
├── Fix/                    &lt;-- Create this folder and add these 3 files:
│   ├── Graphics Rules.sgr
│   ├── Sims2EP9.exe        &lt;-- Your No-CD/crack file
│   └── Video Cards.sgr
│
├── Patches/                &lt;-- Place all official update patches here
│
├── arkitektur_tjek.bat     &lt;-- DOUBLE-CLICK THIS TO START
├── installer_32bit.bat
├── installer_64bit.bat
├── keys_single_discs_32_bit.reg
└── keys_single_discs_64_bit.reg
</code></pre>

<h2>How to use</h2>

<ol>
    <li>
        <strong>Prepare the installation files:</strong><br>
        Either copy your original install media into separate sub-folders within a main installation folder, or download the pre-archived collection here:<br>
        <a href="https://archive.org">https://archive.org</a><br>
        <em>Extract the downloaded .7z file into its own folder.</em>
    </li>
    <br>
    <li>
        <strong>Add the installer files:</strong><br>
        Download this script collection and place all the files directly into the root/main installation folder. This includes:
        <ul>
            <li>The batch scripts (<code>arkitektur_tjek.bat</code>, <code>installer_32bit.bat</code>, <code>installer_64bit.bat</code>)</li>
            <li>The .reg files (<code>keys_single_discs_32_bit.reg</code>, <code>keys_single_discs_64_bit.reg</code>)</li>
            <li>The <code>Fix</code> folder</li>
        </ul>
    </li>
    <br>
    <li>
        <strong>Add your license keys:</strong><br>
        Open either <code>keys_single_discs_64_bit.reg</code> or <code>keys_single_discs_32_bit.reg</code> in Notepad (depending on your system architecture), insert your own license keys where indicated, and save the file. <em>Note: The installation will fail without valid keys.</em>
    </li>
    <br>
    <li>
        <strong>Place your game modifications:</strong><br>
        Make sure your modified No-CD executable (<code>Sims2EP9.exe</code>), along with your updated <code>Graphics Rules.sgr</code> and <code>Video Cards.sgr</code> files, are placed inside the <code>Fix</code> folder.
    </li>
    <br>
    <li>
        <strong>Run the installation:</strong><br>
        Simply double-click <strong><code>arkitektur_tjek.bat</code></strong>.<br><br>
        The script will automatically handle the rest:
        <ul>
            <li>Request necessary administrative privileges.</li>
            <li>Detect whether your system is 32-bit or 64-bit and launch the correct installer.</li>
            <li>Force Windows to bypass expired installation certificates.</li>
            <li>Silently import your license keys into the Windows Registry.</li>
            <li>Install the base game, all expansions, stuff packs, and patches in the strict correct order.</li>
            <li>Automatically apply your No-CD fix and modern graphics/widescreen optimization directly to Mansion & Garden Stuff.</li>
            <li>Copy extra The Sims 2 Store content to your Documents folder.</li>
        </ul>
    </li>
</ol>

<p>Have fun playing!</p>
