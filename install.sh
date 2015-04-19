#!/bin/bash
#Install script

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

if [ -f $dir/.installed ]; then
    echo "Already installed. Exiting..."
    exit 2
fi

confirm () {
    variants='[Y/n]'
    negate=0
    if [ $2 ]; then
        variants='[y/N]'
        negate=1
    fi
    read -r -p "${1:-Are you sure?} $variants " response
    case $response in
        [yY][eE][sS]|[yY])
            if [ $negate -eq 0 ]; then ret=1; else ret=0; fi ;;
        *)
            if [ $negate -eq 0 ]; then ret=0; else ret=1; fi ;;
    esac
    
    return $ret
}

show_help () {
    echo "`basename $0` [-h] - bash config manage tool

Options:
    -h  show this help
"
    exit 0
}

while getopts ":h" opt; do
  case $opt in
    h)
        show_help ;;
  esac
done

confirm "This script will erase contens of ~/.bash_profile and move contents of ~/.bashrc to another file.
Note that this .bashrc file won't be under VCS.
Don't worry, everything will be ok.
> I understand this" || exit 1

bashrc=~/.bashrc
bashrc_saved=$dir/user_bashrc.sh
if [ -f $bashrc ] && [ -s $bashrc ]; then
    cat $bashrc > $bashrc_saved
fi

bash_profile=~/.bash_profile
echo "source ~/.profile
source ~/.bashrc
" > $bash_profile

echo "source $dir/bashrc.sh
" > $bashrc

echo "Done! Restart shell"

touch $dir/.installed