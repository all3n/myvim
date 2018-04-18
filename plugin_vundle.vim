set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " Vim 插件管理
    Plugin 'VundleVim/Vundle.vim'
    " 文件目录管理
    Plugin 'scrooloose/nerdtree'
    " 文件目录管理 Git 标示插件
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    " 注释插件
    Plugin 'scrooloose/nerdcommenter'
    " 文件查找
    Plugin 'kien/ctrlp.vim'
    " 内容快速定位
    Plugin 'easymotion/vim-easymotion'
    " 括号彩虹色匹配高亮
    Plugin 'luochen1990/rainbow'
    " Dash 插件支持
    Plugin 'rizzatti/dash.vim'
    " Header/Souce 切换
    Plugin 'vim-scripts/a.vim'
    " 底部状态栏
    Plugin 'vim-airline/vim-airline'
    " 底部状态栏主题
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'tomasr/molokai'
    " 右侧TagBar
    Plugin 'majutsushi/tagbar'
    Plugin 'echofunc.vim'
    " tab 对齐排版插件
    Plugin 'godlygeek/tabular'
    " markdown 高亮
    Plugin 'plasticboy/vim-markdown'
    Plugin 'iamcco/mathjax-support-for-mkdp'
    " Markdown 浏览器实时预览
    Plugin 'iamcco/markdown-preview.vim'
    " 智能提示插件
    Plugin 'Valloric/YouCompleteMe'
    " 代码片段Snippets
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    " AutoPairs 自动匹配括号
    Plugin 'jiangmiao/auto-pairs'
    " AutoFormat 格式化
    Plugin 'Chiel92/vim-autoformat'

    " 模板
    Plugin 'aperezdc/vim-template'

    " Show Diff
    Plugin 'mhinz/vim-signify'

    " Syntax Check 语法检测
    Plugin 'w0rp/ale'

call vundle#end()            " required

