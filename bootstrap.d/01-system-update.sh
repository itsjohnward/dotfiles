#!/bin/sh
set -e

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing common packages..."
sudo apt-get install -y software-properties-common
