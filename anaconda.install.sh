# based on files provided by professor

#get username that called script
echo $SUDO_USER
ME=$SUDO_USER

#check if user is root (id=0)
if [[ "$(id -u)" -eq 0 ]]; then
	echo "Script is running as root"
	#check if apt is package manager
	#if yes then which apt will specify path to where its stored
	echo $(which apt)
	if [[ -n "$(which apt)" ]]; then
		echo "apt is installed exactly as specified."
		apt install -y \
			libgl1-mesa-glx \
			libegl1-mesa \
			libxrandr2 \
			libxss1 \
			libxcursor1 \
			libxcomposite1 \
			libasound2 \
			libxi6 \
			libxtst6
		if [[ -e $(ls Anaconda3*.sh 2> /dev/null | head -1) ]]; then
			echo "Installer found, running it"
			bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
			echo "PATH=$PATH:/home/kduncan/anaconda3/bin" >> /home/$ME/.profile
		else 
			echo "Downloading enaconda installer"
			curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
			bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
			echo "PATH=$PATH:/home/kduncan/anaconda3/bin" >> /home/$ME/.profile
		fi
	else
		echo "apt is not installed at the specified location."
	fi

else 
	echo "Script is not running as root, exiting..." 1>&2
	exit 1
fi
