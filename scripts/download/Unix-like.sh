#!/bin/sh
set -eu
if [ $RUNNER_OS = macOS ]; then restic_os=darwin; else restic_os=linux; fi
echo ::group::Downloading Restic $version for $restic_os
aria2c -x 16 $GITHUB_SERVER_URL/restic/restic/releases/download/v$version/restic_${version}_${restic_os}_amd64.bz2
bzip2 -d restic_${version}_${restic_os}_amd64.bz2
mkdir Restic
mv restic_${version}_${restic_os}_amd64 Restic/restic
chmod +x Restic/restic
echo ::endgroup::