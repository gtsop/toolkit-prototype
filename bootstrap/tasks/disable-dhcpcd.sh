#!/bin/bash
#
# dhcpcd daemon interferes with wifi connectivity. For that reason it needs to
# be disabled by default
#
# Resource: https://ostechnix.com/fix-job-netctl-service-failed-error-arch-linux/

sudo systemctl stop dhcpcd
sudo systemctl disable dhcpcd
