# make sure the directory exists
New-Item -ItemType Directory -Force -Path "$env:APPDATA/Terminus/"
# configure terminus
Copy-Item "./configs/terminus/config.yaml" -Destination "$env:APPDATA/Terminus/config.yaml"