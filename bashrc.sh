#User-defined .bashrc analog
#Please edit this file instead of ~/.bashrc

#Old .bashrc
if [ -f $this_dir/user_bashrc.sh ]; then
    source user_bashrc.sh
fi

#Aliases file
source aliases.sh