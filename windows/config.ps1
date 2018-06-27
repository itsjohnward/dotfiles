./windows/install-chocolatey # Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install programs with chocolatey
foreach ($line in (Invoke-webrequest -URI "https://raw.githubusercontent.com/itsjohnward/dotfiles/master/windows/choco-programs.txt").Content -split [Environment]::NewLine) {
    choco install $line
}

# install vscode extensions
foreach ($line in (Invoke-webrequest -URI "https://raw.githubusercontent.com/itsjohnward/dotfiles/master/vscode/extensions.txt").Content -split [Environment]::NewLine) {
    code --install-extension $line
}
# configure vscode
(New-Object System.Net.WebClient).DownloadFile( 'https://raw.githubusercontent.com/itsjohnward/dotfiles/master/vscode/settings.json', "$env:APPDATA/Code/User/settings.json" )

# configure terminus
(New-Object System.Net.WebClient).DownloadFile( 'https://raw.githubusercontent.com/itsjohnward/dotfiles/master/windows/terminus/config.yaml', "$env:APPDATA/Terminus/config.yaml" )

# Enter bash and execute playbook with "-t windows"