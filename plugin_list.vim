"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
    " Vim 插件管理
    Plug 'VundleVim/Vundle.vim'
    " 文件目录管理
    Plug 'scrooloose/nerdtree'
    " 文件目录管理 Git 标示插件
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " 注释插件
    Plug 'scrooloose/nerdcommenter'
    " 文件查找
    Plug 'kien/ctrlp.vim'
    " 内容快速定位
    Plug 'easymotion/vim-easymotion'
    " 括号彩虹色匹配高亮
    Plug 'luochen1990/rainbow'
    " Dash 插件支持
    Plug 'rizzatti/dash.vim'
    " Header/Souce 切换
    Plug 'vim-scripts/a.vim'
    " 底部状态栏
    Plug 'vim-airline/vim-airline'
    " 底部状态栏主题
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tomasr/molokai'
    " 右侧TagBar
    Plug 'majutsushi/tagbar'
    " tab 对齐排版插件
    Plug 'godlygeek/tabular'
    " markdown 高亮
    Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/mathjax-support-for-mkdp'
    " Markdown 浏览器实时预览
    Plug 'iamcco/markdown-preview.vim'

    
    "  auto complete {
    " 智能提示插件
    if g:plugin_ycm_enable == 1
        Plug 'Valloric/YouCompleteMe'
        Plug 'tenfyzhong/CompleteParameter.vim'
    endif
    if g:plugin_tabnine_enable == 1
        Plug 'zxqfl/tabnine-vim'
    endif
    if g:plugin_jedi_enable == 1
        Plug 'davidhalter/jedi-vim'
    end
    " }

    " 代码片段Snippets
    if g:plugin_ultisnips_enable == 1
        Plug 'SirVer/ultisnips'
    endif

    if g:plugin_coc_enable == 1
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    endif

    Plug 'honza/vim-snippets'
    " AutoPairs 自动匹配括号
    Plug 'jiangmiao/auto-pairs'
    " AutoFormat 格式化
    Plug 'Chiel92/vim-autoformat'

    " 模板
    Plug 'aperezdc/vim-template'

    " Show Diff
    Plug 'mhinz/vim-signify'

    " Syntax Check 语法检测
    Plug 'w0rp/ale'
    " Menu Plug
    Plug 'skywind3000/quickmenu.vim'

    Plug 'Shougo/echodoc.vim'
    "tmux support 
    Plug 'benmills/vimux'


    " nvim only pluin list
    if has("nvim")
        "python high light
        Plug 'numirias/semshi'
    endif

call plug#end()

