#!/bin/bash
# ==============================================================

# Switch to current directory
cd "${0%/*}"

echo "Cleaning up bootstrapped content..."
rm ../config/salts.php && rm ../config/local-config.php && rm ../config/remote-config.php
rm -rf ../shared
echo "Done."
