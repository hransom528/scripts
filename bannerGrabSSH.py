#!/usr/bin/python3
# Grabs banner of SSH service on specified IP address and port number
import socket

# Input
s = socket.socket()
addr = str(input("IP address: "))
port = str(input("SSH port number: "))

# Connects and grabs banner
s.connect((addr, port))
answer = s.recv(1024)
print(answer)
s.close()
