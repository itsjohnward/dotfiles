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