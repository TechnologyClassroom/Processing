#!/bin/sh

# install-linux32.sh
# Michael McMahon

# Modified from https://processing.org/download/install-arm.sh

# This script installs the latest version of Processing for GNU/Linux 32bit into
# the /usr/local/lib folder.

# Run it like this: "sudo install-linux32.sh"

# This assumes that newer releases are at the top.
TAR="$(curl -sL https://api.github.com/repos/processing/processing/releases | grep -oh -m 1 'https.*linux32.tgz')"

echo "\nDownloading $TAR..."
curl -L $TAR > processing-linux32-latest.tgz

echo "Installing in /usr/local..."
tar fx processing-linux32-latest.tgz -C /usr/local/lib
rm -f processing-linux32-latest.tgz

# This returns the highest version installed.
VER="$(basename $(ls -dvr /usr/local/lib/processing-* | head -1))"

# Symlink target might be a directory, replace.
rm -rf /usr/local/lib/processing
ln -s $VER /usr/local/lib/processing

# This assumes that /usr/local/bin is in $PATH.
ln -sf ../lib/processing/processing /usr/local/bin/processing
ln -sf ../lib/processing/processing-java /usr/local/bin/processing-java

# This assumes that the desktop manager picks up .desktop files in
# the /usr/local/share/applications directory.
mkdir -p /usr/local/share/applications
curl -sL https://raw.githubusercontent.com/processing/processing/master/build/linux/processing.desktop > /usr/local/share/applications/processing.desktop
sed -i "s/@version@/$VER/" /usr/local/share/applications/processing.desktop
sed -i 's|/opt/processing|/usr/local/lib/processing|' /usr/local/share/applications/processing.desktop

# Silence validation errors.
desktop-file-install /usr/local/share/applications/processing.desktop >/dev/null 2>&1

echo "Done! You can start processing by running \"processing\" in the terminal,"
echo "or through the applications menu (might require a restart).\n"
