#!/bin/bash
# ==============================================================

# Switch to current directory
cd "${0%/*}"
cd ..

# Initialize git submodules
echo "Updating submodules..."
git submodule foreach git pull origin master
git pull && git submodule init && git submodule update && git submodule status
echo "Done."
