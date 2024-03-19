#based on script by professor

#get username that called script
echo $SUDO_USER
ME=$SUDO_USER

# check if effective user id is 0 (root)

if [[ "$(id -u)" -eq 0 ]]; then
	echo "Script is running as root"
	# check if apt is package manager
	# if apt is package manager and you run which apt it will specify a path to where its stored
	echo $(which apt)
	if [[ -n "$(which apt)" ]]; then
		echo "apt is installed exactly as specified."
		apt install -y \
			nmap \
			dnsutils \	
	else
		echo "apt is not installed at the specified location."
	fi
else
	echo "Script is not running as root, exiting..." 1>&2
	exit 1
fi
