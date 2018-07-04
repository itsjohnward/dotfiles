# make sure the directory exists
New-Item -ItemType Directory -Force -Path "$env:APPDATA/Terminus/"
# configure terminus
Copy-Item "windows/terminus/config.yaml" -Destination "$env:APPDATA/Terminus/config.yaml"