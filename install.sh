#!/bin/bash
#Install script

dirname='.bash-config'

confirm () {
    variants='[y/N]'
    negate=0
    if [ $2 ]; then
        variants='[Y/n]'
        negate=1
    fi
    read -r -p "${1:-Are you sure?} $variants " response
    case $response in
        [yY][eE][sS]|[yY])
            if [ $negate -eq 0 ]; then ret=0; else ret=1; fi ;;
        *)
            if [ $negate -eq 0 ]; then ret=1; else ret=0; fi ;;
    esac
    
    return $ret
}

show_help () {
    echo "`basename $0` [-h] [-d directory] - bash config manage tool

Options:
    -h  show this help
    -d  set directory for save configs (default $dirname)
"
}

while getopts ":hd" opt; do
  case $opt in
    h)
        show_help ;;
    d)
        dirname=$OPTARG
        echo "Use \"$dir\" as directory." ;;
  esac
done

confirm "This script will erase contens of ~/.bash_profile and move contents of ~/.bashrc to another file.
Don't worry, everything will be ok. I understand this" 1 || exit 1

dir=~/"$dirname"

if [ -d $dir ]; then
    if confirm "Directory ~/$dirname already exists. Remove it?"; then
        rm -rf $dir || (echo "Error. Exiting..." && exit 1)
    else
        echo "Exiting..." && exit 1
    fi
fi

mkdir $dir

$bashrc=~/.bashrc
$bashrc_saved=$dir/user_bashrc.sh
if [ -f $bashrc ] && [ -s $bashrc ]; then
    cat $bashrc > $bashrc_saved
fi

cat $dir/_real_bash_profile.sh > $bash_profile
cat $dir/_real_bashrc.sh > $bashrc
cat $D/_add_profile.sh >> ~/.profile



#D=$_BASH_CONFIG_DIR

#cat $D/_real_bash_profile.sh > ~/.bash_profile
#cat $D/_real_bashrc.sh > ~/.bashrc
#cat $D/_add_profile.sh >> ~/.profile

#rm $D/_real_bash_profile.sh $D/_real_bashrc.sh $D/install.sh
