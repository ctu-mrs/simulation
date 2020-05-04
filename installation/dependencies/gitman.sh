#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND; echo running "$current_command"' DEBUG
trap 'echo "\"${last_command}\" command failed with exit code $?"' EXIT

echo "Installing Gitman"

sudo apt -y install python-pip python3-pip

sudo pip3 install gitman
sudo -H pip3 install gitman

exit 0
