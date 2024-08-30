if [ -z "$1" ]; then
	  echo "Usage: fullscan <IP>"
	    exit 1
fi

IP="$1"

sudo nmap -Pn $IP -v -n -O -A -p- -T4 --min-rate=10000 -oN scan_$IP.txt
