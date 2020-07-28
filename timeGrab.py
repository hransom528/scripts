#!/usr/bin/python3
# Time grabber for ntp and system time
from time import *
import ntplib

# Sets up NTP server connection
addr = "pool.ntp.org"
c = ntplib.NTPClient()
response = c.request(addr)
if (response):
	ntpTime = response.tx_time

# Grabs system datetime
date = time()

# Calculates difference
diff = date - ntpTime

# Outputs
print("NTP Server time: " + ctime(ntpTime))
print("System time: " + ctime(date))
print("Difference: " + str(diff))
 

