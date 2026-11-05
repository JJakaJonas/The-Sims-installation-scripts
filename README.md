<div align="center">
    <h1>🎮 The Sims Legacy Installation Scripts</h1>
    <p><strong>A cross-platform automated deployment suite for running classic The Sims games flawlessly on any OS from Windows XP up to Windows 11.</strong></p>
    <p>
        <img src="https://shields.io" alt="32/64-bit Support">
        <img src="https://shields.io" alt="Windows XP to 11">
        <img src="https://shields.io" alt="MIT License">
    </p>
</div>

<hr>

<h2>📌 About the Project</h2>
<p>This repository contains a comprehensive collection of universal automation scripts designed to install complete collections of <strong>The Sims 1, The Sims 2, The Sims 3</strong>, and <strong>The Sims Medieval</strong>. Built with legacy compatibility in mind, this suite includes dedicated 32-bit and 64-bit routines to ensure flawless execution on native retro gaming rigs (Windows XP/7) as well as modern gaming setups (Windows 10/11).</p>
<p>The scripts seamlessly handle environment layers (like <code>RunAsInvoker</code>) to bypass modern expired certificate blocks, while remaining lightweight enough to execute perfectly on older operating systems without missing dependencies.</p>

<blockquote>
    ⚠️ <strong>Important Legal Notice:</strong> This repository contains <strong>only installation and optimization scripts</strong>. It does not include the game installation media, copyrighted assets, or pre-provided license/serial codes. You must provide your own legally obtained game files and serial keys.
</blockquote>

<h2>📅 Game Support & Status</h2>
<p>Below is the current development status of the installation suite. Each completed game link leads directly to its specific setup guide and folder structure:</p>

<table width="100%">
    <thead>
        <tr>
            <th>Game Title</th>
            <th>Automation Scope & Compatibility</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong><a href="./The%20Sims%201">The Sims 1 (Complete Collection)</a></strong></td>
            <td>Full sequential deployment (Base Game + all expansions), automated serial key injection, No-CD patch deployment, 1080p widescreen resolution tweak & desktop shortcut generation.</td>
            <td>🟢 <strong>Ready to Use</strong></td>
        </tr>
        <tr>
            <td><strong><a href="./The%20Sims%202">The Sims 2 (Complete Collection)</a></strong></td>
            <td>Automatic 32-bit/64-bit architecture routing, expired certificate bypass, silent registry injection, universal legacy graphics fix & store content deployment.</td>
            <td>🟢 <strong>Ready to Use</strong></td>
        </tr>
        <tr>
            <td><strong>The Sims 3 (Complete Collection)</strong></td>
            <td>Multi-OS registry organization, modern CPU/GPU stability fixes & frame-rate management.</td>
            <td>🟡 <em>In Development</em></td>
        </tr>
        <tr>
            <td><strong>The Sims Medieval</strong></td>
            <td>Planned deployment structure & vintage hardware profiling.</td>
            <td>🔴 <em>Not Started Yet</em></td>
        </tr>
    </tbody>
</table>

<h2>🚀 Getting Started</h2>
<ol>
    <li>Navigate into the directory of the specific game you wish to install (e.g., click on the <strong>The Sims 1</strong> or <strong>The Sims 2</strong> link above).</li>
    <li>Read the game-specific <code>README</code> inside that folder to structure your game media folders correctly.</li>
    <li>Configure your personal serial keys inside the designated configuration file (e.g., <code>Serials.txt</code> or <code>.reg</code> files depending on the game).</li>
    <li>Run the master loader script inside that folder. The loader will automatically request administrative privileges, detect your system architecture, and dispatch the installation process.</li>
</ol>

<h2>🛡️ License</h2>
<p>This project is open-source and available under the <strong>MIT License</strong>. Feel free to use, modify, and distribute these scripts to keep the classic Sims community alive across all generations of Windows!</p>

<p align="center"><em>"Sul Sul! Happy Simming!"</em> 💎</p>