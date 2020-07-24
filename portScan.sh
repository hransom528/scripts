#!/bin/bash

# Input
echo "IP Address or IP Range: "
read first
echo "Port(s) to scan: "
read port

# Scan
nmap -sT $first -p $port >/dev/null -oG scanResults
