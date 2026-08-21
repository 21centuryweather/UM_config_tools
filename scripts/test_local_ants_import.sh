#!/bin/bash

# Exit immediately if any command fails
set -e


echo "Loading xp65 module..."
module use /g/data/xp65/public/modules 
module load conda/analysis3-25.12

echo "which python"
which python

echo "Creating test Python script..."
cat << 'EOF' > test_imports.py
import sys

sys.path.insert(0,'/home/548/pag548/cylc-run/rCM3-ancil-suite/share/fcm_make_ants/build/lib/')

print (sys.path)

import ants
EOF

echo "Running test script..."
python test_imports.py

echo "Cleaning up..."
rm test_imports.py
echo "Done."