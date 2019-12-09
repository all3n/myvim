#!/usr/bin/env bash
bin=`dirname "$0"`
export APP_DIR=`cd "$bin/"; pwd`
CMD=$1
if [[ "$CMD" == "clean" ]];then
    vim +PlugClean +qall
    exit 0
elif [[ "$CMD" == "update" ]];then
    vim +PlugUpdate +qall
    exit 0
else
    CMD=install
fi


MYVIM=~/myvim
if [[ ! -d ${MYVIM} ]];then
    git clone https://github.com/all3n/myvim.git $MYVIM
    ln -sf $MYVIM/.vimrc ~/.vimrc
else
    git pull -q $MYVIM
fi

VIMDIR=$MYVIM/.vim
if [[ ! -d ${VIMDIR} ]];then
    mkdir -p $VIMDIR
fi
ln -sf ${VIMDIR} ~/.vim


#VUNDLE_DIR=${VIMDIR}/bundle/Vundle.vim
#if [[ ! -d ${VUNDLE_DIR} ]];then
#    git clone https://github.com/VundleVim/Vundle.vim.git ${VUNDLE_DIR}
#fi
#vim +PluginInstall +qall

PLUGIN_MGR_DIR=${VIMDIR}/autoload/plug.vim
if [[ ! -f ${PLUGIN_MGR_DIR} ]];then
    curl -fLo ${VIMDIR}/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim +PlugInstall +qall

# check YouCompleteMe
YCM=~/.vim/plugged/YouCompleteMe
if [[ -d "$YCM" ]];then
    YCM_CORE=~/.vim/plugged/YouCompleteMe/third_party/ycmd/ycm_core.so
    if [[ ! -f "$YCM_CORE" ]];then
        echo "start to build YouCompleteMe"
        pushd $YCM 2>&1
        /usr/bin/python3 ./install.py --clang-completer
        popd
    fi
fi


