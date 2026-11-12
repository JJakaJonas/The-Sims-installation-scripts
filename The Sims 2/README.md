<h1>The Sims 2 Complete Collection - Automatic Installer</h1>

<p>This open-source script automates the full installation of The Sims 2 and all its expansions/stuff packs on modern systems. It automatically handles user privileges, applies a modern widescreen fix, and deploys everything in the strict chronological order with a single click.</p>

<h2>Features</h2>
<ul>
    <li><strong>Zero-Configuration Graphics:</strong> Includes the Universal Legacy Edition <code>Graphics Rules.sgr</code> for instant 1080p/4K support.</li>
    <li><strong>Security Bypass:</
    <li><strong>Architecture Detection:</strong> Automatically routes the setup through 32-bit or 64-bit processes depending on your OS.</li>
</ul>

<h2>How to Use</h2>

<ol>
    <li>
        <strong>Prepare the installation files:</strong><br>
        Either copy your original install media into separate sub-folders within a main installation folder, or download the pre-archived collection here:<br>
        <a href="https://archive.org/download/the-sims-games-collection/The%20Sims%202.7z" target="The Sims 2 Archive">Direct Download: The Sims 2 Archive Collection (.7z)</a><br>
        <em>Extract the downloaded .7z file into its own folder.</em>
    </li>
    <li>
        <strong>Add the installer files:</strong><br>
        Download this script repository and place all the files directly into the root folder where your game installation folders (like <code>BaseGame</code>) are located.
    </li>
    <li>
        <strong>Verify game modifications:</strong><br>
        The universal <code>Graphics Rules.sgr</code> and the No-CD executable (<code>Sims2EP9.exe</code>) are already included inside the <code>Fix</code> folder. No further action is required here.
    </li>
    <li>
        <strong>Run the installation:</strong><br>
        Simply double-click <strong><code>install.bat</code></strong>.<br><br>
        The script will automatically handle the rest:
        <ul>
            <li>Requests administrative privileges automatically.</li>
            <li>Detects your system architecture (32-bit vs. 64-bit) and triggers the correct routine.</li>
            <li>Installs the base game, expansions, stuff packs, and patches sequentially.</li>
            <li>Applies the widescreen fixes and copies extra Store content directly to your Documents folder.</li>
        </ul>
    </li>
</ol>

<h2>Folder Structure</h2>
<p>Your main installation directory must be structured exactly like this before launching the script:</p>

<pre><code>
The Sims 2 Installation Folder/
│
├── BaseGame/               &lt;-- Installation files (AutoRun.exe)
├── University/             &lt;-- Installation files (AutoRun.exe)
├── Nightlife/              &lt;-- Installation files (AutoRun.exe)
├── FestiveHoliday/         &lt;-- Installation files (setup.exe)
│   └── ... (and so on for all expansion/stuff pack folders)
│
├── Content/
│   └── EA Games/           &lt;-- Store content to be copied to Documents
│
├── Fix/                    &lt;-- Pre-configured files (Included):
│   ├── Graphics Rules.sgr  &lt;-- Universal Legacy Edition
│   └── Sims2EP9.exe        &lt;-- No-CD file
│
├── Patches/                &lt;-- Place all official update patches here
│
├── install.bat             &lt;-- DOUBLE-CLICK THIS TO START
├── installer_32bit.bat
└── installer_64bit.bat
</code></pre>

<p>Have fun playing!</p>
