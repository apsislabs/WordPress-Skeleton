#!/bin/bash
# ==============================================================

# Switch to current directory
cd "${0%/*}"
cd ..

# Initialize git submodules
echo "Installing WordPress..."
git pull && git submodule init && git submodule update && git submodule status
echo "Done."

# Clean Up if We've Bootstrapped Before
echo "Cleaning up existing config..."
rm config/salts.php && rm config/local-config.php && rm config/remote-config.php
echo "Done."

# Grab Salts with Curl
echo "Generating salts from Wordpress.org..."
printf "<?php %s\n" >> config/salts.php
curl -s https://api.wordpress.org/secret-key/1.1/salt >> config/salts.php
echo "Done."

# Copy Local Config
echo "Creating local config file..."
cp -a config/local-config-sample.php config/local-config.php
echo "Done."

# Create Shared Directory
echo "Creating shared uploads directory..."
mkdir -p shared/content/uploads
echo "Done."
