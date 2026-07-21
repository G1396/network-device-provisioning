# Network Device Provisioning

Automated driver installation for USB WiFi adapters on Ubuntu, using DKMS. Each adapter uses a different chipset and driver, but they share the same underlying problem: neither works out of the box on Ubuntu, and the manual setup is a multi-step, easy-to-get-wrong process.

## Why

Setting up USB WiFi adapters on Ubuntu usually means manually cloning a driver repo, fighting DKMS, and sometimes fighting Secure Boot — a process that's tedious to repeat across machines and easy to get wrong. These scripts turn that into a single command per adapter.

## Supported adapters

| Adapter | Chipset/driver | Script |
|---|---|---|
| Intelbras AC1200 | RTL8812AU (gnab/rtl8812au) | intelbras-ac1200/install.sh |
| TP-Link TL-WN823N | RTL8192EU (clnhub/rtl8192eu-linux) | tplink-wn823n/install.sh |

## Prerequisites

- Ubuntu (tested on 18.04, 20.04, and 22.04)
- Root/sudo access
- Secure Boot disabled, or willingness to sign the DKMS module manually — unsigned kernel modules won't load with Secure Boot enabled. The TP-Link script checks Secure Boot status for you via `mokutil`.

## Usage

Run the script for your adapter:

    chmod +x intelbras-ac1200/install.sh
    ./intelbras-ac1200/install.sh

Each script:
1. Removes any conflicting driver package already installed
2. Installs build dependencies (git, DKMS, kernel headers)
3. Clones the correct out-of-tree driver
4. Builds and installs it via DKMS

## Note

These are standalone scripts, not a generic "any adapter" installer — each targets one specific chipset/driver pair. Adding support for another adapter means adding a new folder with its own script.
