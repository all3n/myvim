# myvim 

## 安装
full version:
```bash
curl https://raw.githubusercontent.com/all3n/myvim/master/myvim.sh -L -o - |bash
```
simple version:
```
curl -o ~/.vimrc https://raw.githubusercontent.com/all3n/myvim/master/.vimrc.simple
```

## 自定义配置
1. ~/myvim/plugin_vundle.vim
    1. 定义插件列表
1. ~/myvim/plugin_config.vim
    1. 插件相关配置
    1. 可以在 https://vimawesome.com/ 上搜索插件



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
    1. %  对应括号之前切换
    1. Tab Buffer
        1. C+N 下一个Buffer Tab
        1. C+M 上一个Buffer Tab
    1. Save
        1. Leader w  保存
        1. Leader sudo   强制保存
    1. Paste
        1. F4
    1. Format
        1. Leader f    ggVG=

## Fold 折叠
    1. 打开关闭单个折叠 zo,zc
    1. 打开关闭全部折叠 zr,zm


## Leader
    1. 以下<leader>都是指 逗号,



## [NERDTree]
1. `<Leader>e` Toggle NERDTree
1. Shift + i   Toggle Show Hidden Files

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
    1. CompleteParameter.vim 增强YCM 显示参数 C-j 下一个参数 C-k 上一个参数
    1. echodoc.vim 在调用函数在下方显示具体参数
    1. 快捷键:
        1. Ctrl + i 提示补全
        1. leader + gl   跳转定义
        1. leader + gf   跳转声明
        1. leader + gg   跳转定义或者声明
        1. 前跳 Ctrl + O
        1. 后跳 Ctrl + I
## [Ale]
    1. 语法检查插件
    1. python
        1. pip install --user flake8
    1. 快捷键
        1. <Leader>s   Toggle ALE 提示
        1. <Leader>d    查看ALE具体提示

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



## [Tabularize] 排版插件 按指定符号对齐

 * `<Leader>a= :Tabularize /=<CR>`
 * `<Leader>a: :Tabularize /:<CR>`
 * `<Leader>a:: :Tabularize /:\zs<CR>`
 * `<Leader>a, :Tabularize /,<CR>`
 * `<Leader>a<Bar> :Tabularize /<Bar><CR>`

## [Tagbar]
 * <leader> tt   Toggle TagBar

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
    * molokai

## Snippets
1. Tab Expand Snippets


## A.vim
    1. F9 source/header Toggle

## AutoFormat
    1. F8 进行AutoFormat
    1. 如果不生效可以打开 let g:autoformat_verbosemode=1 查看原因
    1. python pep8 
        1. pip install --user yapf
    1. c++/c/java:atyle
        1. apt-get install astyle
        1. or build from source:http://astyle.sourceforge.net/ 
## CTags
    1. tags = ./tags;~/.vimtags
    1. F10 gen-ctags
    1. Ctrl ] 跳转定义
    1. g] 跳转列表 选择
    1. Ctrl t 返回
    1. common load: ~/.vim/tags/*.tags
    1. app tags: tagsfile    each line is tagfilepath

## MarkdownPreview
    1. :MarkdownPreview 或则  <Leader>md

## quick menu
    1. F12


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
