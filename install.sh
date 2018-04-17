#!/usr/bin/env bash
VIMDIR=~/.vim

if [[ ! -d ${VIMDIR} ]];then
    mkdir -p $VIMDIR
fi

VUNDLE_DIR=${VIMDIR}/bundle/Vundle.vim


if [[ ! -d ${VUNDLE_DIR} ]];then
    git clone https://github.com/VundleVim/Vundle.vim.git ${VUNDLE_DIR}
fi


vim +PluginInstall +qall
