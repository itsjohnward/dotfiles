./windows/install-chocolatey # Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install vscode
choco install terminus --pre
choco install chrome

# install vscode extensions
foreach($line in (Invoke-webrequest -URI "https://raw.githubusercontent.com/itsjohnward/dotfiles/master/vscode/extensions.txt").Content) {
    code --install-extension $line
}
# configure vscode
(New-Object System.Net.WebClient).DownloadFile( 'https://raw.githubusercontent.com/itsjohnward/dotfiles/master/vscode/settings.json', '$env:APPDATA/Code/User/settings.json' )

# configure terminus
(New-Object System.Net.WebClient).DownloadFile( 'https://raw.githubusercontent.com/itsjohnward/dotfiles/master/windows/terminus/config.yaml', '$env:APPDATA/Roaming/Terminus/config.yaml' )

# Enter bash and execute playbook with "-t windows"