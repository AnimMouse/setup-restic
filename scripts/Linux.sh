#!/bin/sh
version=$(curl -s https://api.github.com/repos/restic/restic/releases/latest | jq -r '.tag_name')
echo ::group::Downloading Restic $version for Linux
aria2c -x 16 https://github.com/restic/restic/releases/download/$version/restic_${version}_linux_amd64.bz2
bzip2 -d restic_${version}_linux_amd64.bz2
chmod +x restic_${version}_linux_amd64.bz2
mkdir Restic
mv restic_${version}_linux_amd64.bz2 Restic/
chmod 
echo ::endgroup::