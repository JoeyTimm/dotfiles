#based on script from professor

# get username that called script
echo $SUDO_USER
ME=$SUDO_USER

#check if user is root (id=0)
if [[ "$(id -u)" -eq 0 ]]; then
	echo "Script is running as root"

	if [[ -e $(ls awsdl/awscliv2.zip 2> /dev/null | head -1) ]]; then
		echo "AWS CLI V2 install found, running it"
		unzip awsdl/awscliv2.zip -d awsdl/
		./awsdl/aws/install 
	else 
		mkdir awsdl
		curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awsdl/awscliv2.zip"
		unzip awsdl/awscliv2.zip -d awsdl/
		./awsdl/aws/install
	fi

else 
	echo "Script is not running as root, exiting..." 1>2&
	exit 1
fi

