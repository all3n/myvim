bin=`dirname "$0"`
export APP_DIR=`cd "$bin/"; pwd`

VIMDIR=$HOME/.vim
PLUGIN_MGR_DIR=${VIMDIR}/autoload/plug.vim
if [[ ! -f ${PLUGIN_MGR_DIR} ]];then
    curl -fLo ${VIMDIR}/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
if [[ -f $APP_DIR/vim-simple-plugins.vim ]];then
    cp -f $APP_DIR/vim-simple-plugins.vim ~/.vimrc
else
    curl -fLo $HOME/.vimrc https://raw.githubusercontent.com/all3n/myvim/master/vim-simple-plugins.vim
fi
vim +PlugInstall +qall

