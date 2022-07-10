#!/bin/bash
set -eu
version=$(curl -s $GITHUB_API_URL/repos/restic/restic/releases/latest | jq -r .tag_name)
echo ::group::Downloading Restic $version for macOS
aria2c -x 16 $GITHUB_SERVER_URL/restic/restic/releases/download/$version/restic_${version/v}_darwin_amd64.bz2
bzip2 -d restic_${version/v}_darwin_amd64.bz2
mkdir Restic
mv restic_${version/v}_darwin_amd64 Restic/restic
chmod +x Restic/restic
echo ::endgroup::