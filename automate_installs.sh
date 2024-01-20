#usr/bin/env bash

# Future implementation:
# echo "Enter the directory to send this script to, 
#so it can be executed (e.g. zlinsco@pc533.emulab.net:users/zlinsco):"
#read expdir

#scp "$0" "expdir"


# Install miniconda
echo "Installing miniconda"
mkdir -p ~/miniconda3

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh

bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3

rm -rf ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

# Ask user for environment name they want
echo "Enter the name for the conda env:"
read name


conda create --name $name python=3.11
conda init bash
source ~/miniconda3/etc/profile.d/conda.sh
conda activate $name


# Update, htop, and screen install
echo "Updating... Additionally, installing htop and screen"
sudo apt-get update
sudo install htop
sudo install screen


# Jupyter Notebook install
echo "Time to install jupyter notebook."
conda install -c conda-forge notebook
conda install -c conda-forge nb_conda_kernels
conda install nb_conda


# Prompt user if they want to open Notebook
while true; 
do

read -p "Do you wish to install this program? [y,n]" yn
case $yn in 
	[Yy]* ) readarray -t lines < <(jupyter notebook --no-browser --port=5900)
		for line in "${lines[@]}"; 
		do
			if printf '%s\0' "${lines[@]}" | grep -Fxqz -- 'http://localhost:5900';
			then
				jup_link=$"{lines[@]}";
				echo $jup_link;
			fi
		done
		break;;
	[Nn]* ) echo "Cool, see ya later then...";
		exit;;

esac

done


