To configure Windows, execute the following four commands as administrator in a PowerShell:

1. `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
2. `Restart-Computer`
3. `Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/itsjohnward/dotfiles/master/windows/enable-wsl.ps1'))`
4. `Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/itsjohnward/dotfiles/master/windows/config.ps1'))`