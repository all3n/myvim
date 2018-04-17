# myvim 

## 安装
```bash
curl https://raw.githubusercontent.com/all3n/myvim/myvim.sh -L -o - |bash
```

## 自定义配置
1. ~/myvim/plugin_vundle.vim
    1. 定义插件列表
1. ~/myvim/plugin_config.vim
    1. 插件相关配置

## 更新VIM 插件
```bash
    cd $HOME/myvim
    ./myvim.sh
    或者
    git pull
    vim +PluginInstall +qall
```
clean

```
    cd $HOME/myvim
    ./myvim.sh clean

```

## General
    1. <leader>sudo sudo save


## Leader
    1. 以下<leader>都是指 逗号,



## [NERDTree]
1. `<Leader>e` Toggle NERDTree

## [ctrlp]
1. `<c-p>`.

## [Surround]

```
调整包围符号([{}])类操作
      Old text                  Command     New text ~
      "Hello *world!"           ds"         Hello world!
      (123+4*56)/2              cs])        (123+456)/2
      "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
      if *x>3 {                 ysW(        if ( x>3 ) {
      my $str = *whee!;         vllllS'     my $str = 'whee!';
```

## [NERDCommenter]

**快捷键** `<Leader>c<space>` 


## [YouCompleteMe]
1. Custom Your Flags
    1. ~/.config/ycm_flags.conf
        ```
        -I/usr/include/c++/6
        -I/usr/include/x86_64-linux-gnu/c++/6
        -I/usr/lib/gcc/x86_64-linux-gnu/6/include
        -I/usr/include/x86_64-linux-gnu
        -I$HOME/XXX/include
        ```
## [Syntastic]
    1. 语法检查插件
## [AutoClose]
    1. 自动闭合
## [Fugitive]
    1. Git 操作
        1. :Gdiff
        1. :Gstatus <leader>gs
    2. 常见操作
         * `<leader>gs` :Gstatus<CR>
         * `<leader>gd` :Gdiff<CR>
         * `<leader>gc` :Gcommit<CR>
         * `<leader>gb` :Gblame<CR>
         * `<leader>gl` :Glog<CR>
         * `<leader>gp` :Git push<CR>
         * `<leader>gw` :Gwrite<CR>
         * :Git ___ will pass anything along to git.


## [PIV] PHP

## [Ack.vim]

## [Tabularize] 排版插件 按指定符号对齐

 * `<Leader>a= :Tabularize /=<CR>`
 * `<Leader>a: :Tabularize /:<CR>`
 * `<Leader>a:: :Tabularize /:\zs<CR>`
 * `<Leader>a, :Tabularize /,<CR>`
 * `<Leader>a<Bar> :Tabularize /<Bar><CR>`

## [Tagbar]
 * leader tt:Toggle TagBar

## [EasyMotion] 快速定位
    1. `<leader><leader>w`  `<leader><leader>b`  word/back
    1. `<leader><leader>s` 搜索第一个字母
    1. 列跳
        1. `<leader><leader>j`
        1. `<leader><leader>k`
    1. 行内跳
        1. `<leader><leader>h`
        1. `<leader><leader>l`
## [Airline] 彩色状态条

## Amazing Colors

* ir_black
* molokai
* peaksea

## Snippets
1. Tab Expand Snippets


## A.vim
    1. F9 source/header Toggle

## CTags
    1. tags = ./tags;~/.vimtags
    1. F10 gen-ctags

## MarkdownPreview
    1. :MarkdownPreview


## Useful commands
 ![cheat sheet](http://www.viemu.com/vi-vim-cheat-sheet.gif).


## Vim
1. 如果你的vim 不支持python，需要下载源码重新编译 vim --version
1. Compile

```
git clone https://github.com/vim/vim.git

./configure --prefix=/opt/vim --enable-multibyte --enable-python3interp=yes --with-features=huge --enable-cscope --enable-rubyinterp=yes --enable-pythoninterp=yes --enable-luainterp=yes --enable-gui=gtk2
make
make install

sudo update-alternatives --install /usr/bin/vim vim /opt/vim/bin/vim 50
sudo update-alternatives --install /usr/bin/vimdiff vimdiff /opt/vim/bin/vimdiff 50
sudo update-alternatives --install /usr/bin/vimtutor vimtutor /opt/vim/bin/vimtutor 50
```
