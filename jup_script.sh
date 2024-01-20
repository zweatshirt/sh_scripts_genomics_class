#usr/bin/env bash

# Jupyter Notebook install
echo "Time to install jupyter notebook."
conda install -c conda-forge notebook
conda install -c conda-forge nb_conda_kernels
conda install nb_conda

read -p "Do you wish to start a Jupyter Notebook? [y,n]" yn
case $yn in
	[Yy]* ) cmd1="jupyter notebook --no-browser --port=5900";
             	cmd2="xterm -hold -e ssh -L 5555:localhost:$user";
		readarray -t lines < <($cmd1);
                	for line in "${lines[@]}";
                  		do
				if printf '%s\0' "${lines[@]}" | grep -Fxqz -- 'http://localhost:5900';
                          	then
                                	jup_link=$"{lines[@]}";
                                  	bash -c $cmd2
                          	fi
                  	done
                  	break;;
        [Nn]* ) echo "Cool, see ya later then...";
                 exit;;
 esac

