#!/bin/sh
set -eu
if [ $RUNNER_OS = macOS ]; then os=darwin; else os=linux; fi
echo ::group::Downloading Restic $version for $RUNNER_OS
aria2c -x 16 $GITHUB_SERVER_URL/restic/restic/releases/download/v$version/restic_${version}_${os}_amd64.bz2
bzip2 -d restic_${version}_${os}_amd64.bz2
mkdir Restic
mv restic_${version}_${os}_amd64 Restic/restic
chmod +x Restic/restic
echo ::endgroup::