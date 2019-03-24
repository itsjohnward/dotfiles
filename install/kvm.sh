# install packages
sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils libvirt

# verify installation
virsh list --all
