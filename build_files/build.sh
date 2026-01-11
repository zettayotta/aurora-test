#!/bin/bash

set -ouex pipefail

### Setup repos

# Vivaldi
# dnf config-manager addrepo --from-repofile=https://repo.vivaldi.com/archive/vivaldi-fedora.repo

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# dnf install -y tmux

# Layer Vivaldi into the image via rpm-ostree
# rpm-ostree install vivaldi-stable

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# Synology Drive from COPR
dnf -y copr enable emixampp/synology-drive
rpm-ostree  install synology-drive-noextra
dnf -y copr disable emixampp/synology-drive

# Removes those cached packages and metadata, which is standard practice in image builds.
# dnf5 clean all

#### Example for enabling a System Unit File

systemctl enable podman.socket
