VIM_BUILD=/tmp/vim
if [[ ! -d "$VIM_BUILD" ]];then
    git clone https://github.com/vim/vim.git /tmp/vim
fi

#sudo apt install build-essential cmake python-dev python3-dev
#sudo apt install lua5.3-dev
export PATH=/usr/bin:$PATH

pushd $VIM_BUILD 2>&1
./configure --prefix=/opt/vim --enable-multibyte --enable-python3interp=yes --with-features=huge --enable-cscope --enable-rubyinterp=yes --enable-pythoninterp=yes --enable-luainterp=yes 
make -j$(nproc)
make install
popd
