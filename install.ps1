function Add-Program([string] $Id) {
	winget install --accept-package-agreements --accept-source-agreements --exact --id "$Id" --verbose
}

Add-Program '7zip.7zip' # 7-Zip
Add-Program 'AutoHotkey.AutoHotkey' # AutoHotkey
Add-Program 'Mythicsoft.AgentRansack' # Agent Ransack
Add-Program 'Brother.iPrintScan' # Brother iPrint&Scan
#Add-Program 'Piriform.CCleaner' # CCleaner
Add-Program 'Piriform.Defraggler' # Defraggler
Add-Program 'Discord.Discord' # Discord
Add-Program 'Docker.DockerDesktop' # Docker Desktop
Add-Program 'Exercism.CLI' # Exercism CLI
Add-Program 'Gyan.FFmpeg' # FFmpeg
Add-Program 'Fork.Fork' # Fork
Add-Program 'jqlang.jq' # jq
Add-Program 'DominikReichl.KeePass' # KeePass Password Safe
Add-Program 'CodecGuide.K-LiteCodecPack.Standard' # K-Lite Codec Pack tandard
Add-Program 'LEGO.LEGOEducationSPIKE' # LEGO Education SPIKE
Add-Program 'LibreWolf.LibreWolf' # LibreWolf
Add-Program 'rocksdanister.LivelyWallpaper' # Lively Wallpaper
Add-Program 'Logitech.CameraSettings' # Logitech Camera Settings
Add-Program 'MusicBrainz.Picard' # MusicBrainz Picard
Add-Program 'Oracle.MySQLWorkbench' # MySQL Workbench
Add-Program 'Notepad++.Notepad++' # Notepad++
Add-Program 'OBSProject.OBSStudio' # OBS Studio
Add-Program 'Ollama.Ollama' # Ollama
Add-Program 'OpenRGB.OpenRGB' # OpenRGB
Add-Program 'Proton.ProtonVPN' # Proton VPN
Add-Program 'RaspberryPiFoundation.RaspberryPiImager' # Raspberry Pi Imager
Add-Program 'Libretro.RetroArch' # RetroArch
Add-Program 'Rufus.Rufus' # Rufus
Add-Program 'ShareX.ShareX' # ShareX
Add-Program 'Valve.Steam' # Steam
Add-Program 'IDRIX.VeraCrypt' # VeraCrypt
Add-Program 'WinDirStat.WinDirStat' # WinDirStat

#Add-Program 'Elgato.CameraHub' # Elgato Camera Hub
Add-Program 'Elgato.StreamDeck' # Elgato Stream Deck
#Add-Program 'Elgato.WaveLink' # Elgato Wave Link

Add-Program 'Microsoft.Git' # Git
Add-Program 'Microsoft.PowerShell' # PowerShell 7-x64
Add-Program 'Microsoft.Sysinternals.RDCMan' # Remote Desktop Connection Manager
Add-Program 'Microsoft.Teams' # Microsoft Teams
Add-Program 'Microsoft.VisualStudio.Community' # Visual Studio Community
Add-Program 'Microsoft.VisualStudioCode' # Microsoft Visual Studio Code
Add-Program 'Microsoft.WSL' # Windows Subsystem for Linux
Add-Program 'Microsoft.WindowsTerminal' # Windows Terminal
