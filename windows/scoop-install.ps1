# PowerShell script to install Scoop and essential tools on Windows

# Check if Scoop is already installed
if (Get-Command scoop -ErrorAction SilentlyContinue) {
    Write-Host "Scoop is already installed."
} else {
    Write-Host "Installing Scoop..."
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

# Install essential tools
Write-Host "Installing essential tools..."
scoop install main/git
scoop install main/7zip
scoop install main/aria2
scoop install main/winget
scoop install main/fastfetch
scoop install main/uutils-coreutils
scoop install main/gsudo

# Add bucket for more tools
scoop bucket add extras
scoop bucket add versions

# Install additional useful tools
Write-Host "Installing useful tools..."
scoop install extras/windows-terminal
scoop install extras/irfanview
scoop install extras/vlc
scoop install extras/librewolf
scoop install extras/tor-browser
scoop install extras/notepadplusplus
scoop install main/tealdeer
scoop install extras/vscode

gsudo scoop install extras/vcredist-aio
gsudo scoop install versions/windowsdesktop-runtime-6.0
gsudo scoop install extras/windowsdesktop-runtime

# Install gimmicky/fun tools (optional)
Write-Host "Installing gimmicky tools..."
scoop install extras/runcat

Write-Host "Installation complete!"