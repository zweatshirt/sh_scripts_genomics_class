#usr/bin/env bash

echo "Installing conda"
mkdir -p ~/miniconda3

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh

bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3

rm -rf ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

echo "Enter the name for the conda env"
read name

conda create --name $name python=3.11
conda activate $name

echo "Updating... Additionally, installing htop and screen"
sudo apt-get update
sudo install htop
sudo install screen

echo "Time to install jupyter notebook"
conda install -c conda-forge notebook
conda install -c conda-forge nb_conda_kernels
conda install nb_conda





