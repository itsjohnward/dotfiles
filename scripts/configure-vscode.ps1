$env:Path += ";C:\Program Files\Microsoft VS Code" # register the new "code" command

# install vscode extensions
foreach ($line in Get-Content vscode/extensions.txt) {
    code --install-extension $line
}

# make sure the directory exists
New-Item -ItemType Directory -Force -Path "$env:APPDATA/Code/User/"

# configure vscode
Copy-Item "../config/vscode/settings.json" -Destination "$env:APPDATA/Code/User/settings.json"