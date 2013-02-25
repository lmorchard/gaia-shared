#!/bin/sh

# This repo was created from mozilla-b2g/gaia like so:
#     git filter-branch --prune-empty --subdirectory-filter shared -- --all
#
# This script hopes to make tracking changes from the upstream project easier.
# I'm sure I'm doing it wrong. Pull requests welcome!

# Update our gaia repo.
pushd ../gaia
git pull origin master
popd

# Make a fresh gaia clone, strip it down to just shared subdirectory
pushd ..
rm -rf gaia-munge
git clone gaia gaia-munge
cd gaia-munge
git filter-branch --prune-empty --subdirectory-filter shared -- --all
popd

# Pull changes into gaia-shared
git pull ../gaia-munge

# Clean up!
rm -rf ../gaia-munge
