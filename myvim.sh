#!/usr/bin/env bash
bin=`dirname "$0"`
export APP_DIR=`cd "$bin/"; pwd`
CMD=$1
if [[ "$CMD" == "clean" ]];then
    vim +PluginClean +qall
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
if [[ ! -f $MYVIM/config.local.vim  ]];then
    cp $MYVIM/config.vim $MYVIM/config.local.vim
fi

VIMDIR=$MYVIM/.vim
if [[ ! -d ${VIMDIR} ]];then
    mkdir -p $VIMDIR
fi

if [[ -L ~/.vim ]];then
    ln -sf ${VIMDIR} ~/.vim
elif [[ -d ~/.vim ]];then
    mv ~/.vim ~/.vim_bakup
    ln -sf ${VIMDIR} ~/.vim
fi

PLUGIN_MGR_DIR=${VIMDIR}/autoload/plug.vim
if [[ ! -f ${PLUGIN_MGR_DIR} ]];then
    curl -fLo ${VIMDIR}/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim +PlugInstall +qall

# check YouCompleteMe
YCM=~/.vim/bundle/YouCompleteMe
if [[ -d "$YCM" ]];then
    YCM_CORE=~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so
    if [[ ! -f "$YCM_CORE" ]];then
        echo "start to build YouCompleteMe"
        pushd $YCM 2>&1
        ./install.py --clang-completer
        popd
    fi
fi


