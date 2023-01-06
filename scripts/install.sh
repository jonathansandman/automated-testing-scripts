#!/bin/bash

FILTER="Installer"

# prevent patterns that match nothing
shopt -s nullglob

IFS=$'\n'; set -f

echo Specify the folder that contains the installers:
read folder

eval targetFolder=${folder}

# mount any installers
for v in $(find "$targetFolder" -name "*$FILTER*.dmg"); do
	echo "Mounting $v..."
	# mount the file
	sudo hdiutil attach "$v"
done

# iterate over all volumes
for f in $(find /Volumes -maxdepth 1 -type d -name "*$FILTER*"); do
	pkgFound=0
	echo $f
	for p in $(find "$f" -name "*$FILTER*.pkg"); do
		target=$(installer -dominfo -pkg "$p")
		echo "Installing $p with target='$target'..."
		sudo installer -pkg "$p" -target "$target"
		pkgFound=1
	done
	if [ $pkgFound -eq 1 ]; then
		echo "Unmounting $f..."
		hdiutil detach "$f"
	fi
done