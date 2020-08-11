#!/usr/bin/bash

# Unsorted
echo "Hostname info: "
hostname
hostname -I

# Private IPV4
echo
echo "Private IPV4: "
hostname -I | awk '{print $1}'

# Public IPV4
echo
echo "Public IPV4: "
curl ifconfig.me ; echo

# Public IPV6
echo
echo "Public IPV6: "
curl icanhazip.com ; echo
