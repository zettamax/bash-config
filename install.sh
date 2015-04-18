#Install script

D=$_BASH_CONFIG_DIR

cat $D/_real_bash_profile.sh > ~/.bash_profile
cat $D/_real_bashrc.sh > ~/.bashrc

rm $D/_real_bash_profile.sh $D/_real_bashrc.sh $D/install.sh
