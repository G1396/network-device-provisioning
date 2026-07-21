#!/bin/bash

# Update package lists
sudo apt update

# Check whether the rtl8812au-dkms package is already installed
if dpkg -l | grep -q rtl8812au-dkms; then
    echo "Package rtl8812au-dkms found. Removing..."
    sudo apt remove -y rtl8812au-dkms
else
    echo "Package rtl8812au-dkms not found. Continuing installation..."
fi

# Install Git
sudo apt install -y git

# Clone the driver source
git clone https://github.com/gnab/rtl8812au.git

# Add the module to DKMS
sudo dkms add ./rtl8812au

# Build the module
sudo dkms build 8812au/4.2.2

# Install the module
sudo dkms install 8812au/4.2.2

echo "Intelbras AC1200 driver installation complete!"
