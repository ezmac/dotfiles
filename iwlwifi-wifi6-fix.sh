#!/bin/bash
#
# Intel iwlwifi WiFi 6/6E Fix Script
# Disables 11ax to resolve "Unhandled alg: 0x707" and connection drop issues
# Tested on: Intel Meteor Lake PCH CNVi WiFi [8086:7e40]
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Intel iwlwifi WiFi 6/6E Fix Script${NC}"
echo "=================================="
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Error: This script must be run as root (use sudo)${NC}"
    exit 1
fi

# Check if iwlwifi module is loaded
if ! lsmod | grep -q "^iwlwifi"; then
    echo -e "${RED}Error: iwlwifi module is not loaded${NC}"
    exit 1
fi

echo "Step 1: Creating modprobe configuration..."
echo "options iwlwifi disable_11ax=Y" > /etc/modprobe.d/iwlwifi-fix.conf
if [ -f /etc/modprobe.d/iwlwifi-fix.conf ]; then
    echo -e "${GREEN}✓ Configuration file created${NC}"
else
    echo -e "${RED}✗ Failed to create configuration file${NC}"
    exit 1
fi

echo ""
echo "Step 2: Reloading iwlwifi driver modules..."
echo "  (WiFi will disconnect briefly)"

# Unload modules
modprobe -r iwlmvm 2>/dev/null || true
modprobe -r iwlwifi 2>/dev/null || true
sleep 1

# Reload modules
modprobe iwlwifi
modprobe iwlmvm
sleep 2

echo -e "${GREEN}✓ Driver modules reloaded${NC}"

echo ""
echo "Step 3: Verifying configuration..."

# Check if parameter is set
DISABLE_11AX=$(cat /sys/module/iwlwifi/parameters/disable_11ax 2>/dev/null || echo "N")
if [ "$DISABLE_11AX" = "Y" ]; then
    echo -e "${GREEN}✓ WiFi 6/6E (11ax) is now disabled${NC}"
else
    echo -e "${RED}✗ Configuration did not apply (showing: $DISABLE_11AX)${NC}"
    echo "  You may need to reboot for changes to take effect"
    exit 1
fi

# Check if WiFi interface is up
WIFI_IFACE=$(ip link | grep -o "wlp[0-9a-z]*" | head -1)
if [ -n "$WIFI_IFACE" ]; then
    WIFI_STATE=$(ip link show "$WIFI_IFACE" | grep -o "state [A-Z]*" | awk '{print $2}')
    echo -e "${GREEN}✓ WiFi interface $WIFI_IFACE is $WIFI_STATE${NC}"
else
    echo -e "${YELLOW}⚠ Could not detect WiFi interface${NC}"
fi

echo ""
echo -e "${GREEN}Fix applied successfully!${NC}"
echo ""
echo "Next steps:"
echo "  1. Wait 10-15 seconds for WiFi to reconnect"
echo "  2. Test your connection for 30-60 minutes"
echo "  3. Monitor with: journalctl -f -k | grep -E '(disconnect|Unhandled)'"
echo ""
echo "To undo this fix:"
echo "  sudo rm /etc/modprobe.d/iwlwifi-fix.conf"
echo "  sudo modprobe -r iwlmvm && sudo modprobe -r iwlwifi"
echo "  sudo modprobe iwlwifi && sudo modprobe iwlmvm"
