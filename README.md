# Dotfiles

## Install Mac Programs:

Run brew.sh to install and configure programs

## How dotfiles are managed:

https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

## Clone dotfiles

```
git clone --recurse-submodules <url>
```

### Build Command-T

```
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
```

## Run ansible playbook

```
ansible-playbook main.yml --connection=local -t [windows|mac|linux]
```

[![Build status](https://ci.appveyor.com/api/projects/status/i1asf5truovqwb8g/branch/master?svg=true)](https://ci.appveyor.com/project/itsjohnward/dotfiles/branch/master)


To configure Windows, execute the following four commands as administrator in a PowerShell:

1. `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
2. `Restart-Computer`
3. `Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/itsjohnward/dotfiles/master/windows/enable-wsl.ps1'))`
4. `Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/itsjohnward/dotfiles/master/windows/config.ps1'))`