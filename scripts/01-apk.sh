#!/bin/sh -eux

# Configure the main repository mirrors
printf 'https://mirror.math.princeton.edu/pub/alpinelinux/v3.15/main\n' >/etc/apk/repositories
printf 'https://mirror.math.princeton.edu/pub/alpinelinux/v3.15/community\n' >>/etc/apk/repositories

# Update the package list and then upgrade.
apk update --no-cache
apk upgrade

# Install various basic system utilities.
apk add docker bash wget curl sudo grep

# set vagrant user permissions to use docker commands without sudo
addgroup vagrant docker

# add docker to OpenRC default run-level
rc-update add docker default

# Reboot onto the new kernel (if applicable).
reboot
