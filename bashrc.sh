#User-defined .bashrc analog
#Please edit this file instead of ~/.bashrc

#Old .bashrc
if [ -f $_BASH_CONFIG_DIR/user_bashrc.sh ]; then
    source $_BASH_CONFIG_DIR/user_bashrc.sh
fi

#Aliases file
source $_BASH_CONFIG_DIR/aliases.sh