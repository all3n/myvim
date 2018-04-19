VIM_BUILD=/tmp/vim
if [[ ! -d "$VIM_BUILD" ]];then
    git clone https://github.com/vim/vim.git /tmp/vim
fi

pushd $VIM_BUILD 2>&1
./configure --prefix=/opt/vim --enable-multibyte --enable-python3interp=yes --with-features=huge --enable-cscope --enable-rubyinterp=yes --enable-pythoninterp=yes --enable-luainterp=yes
make
make install
popd
