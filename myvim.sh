#!/usr/bin/env bash
CMD=$1
if [[ "$CMD" == "clean" ]];then
    vim +PluginClean +qall
    exit 0
else
    CMD=install
fi

VIMDIR=~/.vim

if [[ ! -d ${VIMDIR} ]];then
    mkdir -p $VIMDIR
fi

VUNDLE_DIR=${VIMDIR}/bundle/Vundle.vim

MYVIM=~/myvim
YCM=~/.vim/bundle/YouCompleteMe

if [[ ! -d ${MYVIM} ]];then
    git clone https://github.com/all3n/myvim.git $MYVIM
    ln -sf $MYVIM/.vimrc ~/.vimrc
else
    git pull -q $MYVIM
fi


if [[ ! -d ${VUNDLE_DIR} ]];then
    git clone https://github.com/VundleVim/Vundle.vim.git ${VUNDLE_DIR}
fi

vim +PluginInstall +qall



# check YouCompleteMe
if [[ -d "$YCM" ]];then
    YCM_CORE=~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so
    if [[ ! -f "$YCM_CORE" ]];then
        echo "start to build YouCompleteMe"
        pushd $YCM 2>&1
        ./install.py --clang-completer
        popd
    fi
fi


