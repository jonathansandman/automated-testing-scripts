# Test Automation
A collection of scripts and resources designed to help with testing products

Check the wiki for a collection of testing, test automation tooling and guides.

## install.sh

Mounts all .dmgs in the folder path specified, installs any .pkgs that it find at the top level, and unmounts the .dmgs.

> :warning: By default, this script only mounts .dmgs, Volumes and .pkgs that include the string 'Installer'. You can edit the FILTER variable at the top of the script to change this behaviour.

![](gifs/install.gif)

1. Open the terminal where 'install.sh' is installed.
1. Run 'sh install.sh'.
1. Drag and drop the desired directory into the terminal.
1. Press Enter.
1. Enter your password.
