"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/myvim/.vim/plugged')
    " Vim 插件管理
    " 文件目录管理
    Plug 'scrooloose/nerdtree'
    " 文件目录管理 Git 标示插件
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " 注释插件
    Plug 'scrooloose/nerdcommenter'
    " 文件查找
    "Plug 'kien/ctrlp.vim'
    Plug 'junegunn/fzf.vim'
    "Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
    Plug 'junegunn/fzf'

    " 内容快速定位
    Plug 'easymotion/vim-easymotion'
    " 括号彩虹色匹配高亮
    Plug 'luochen1990/rainbow'
    " Dash 插件支持 for mac
    if g:plugin_dash_enable == 1
        Plug 'rizzatti/dash.vim'
    endif
    " Zeal support for linux
    if g:plugin_zeal_enable == 1
        Plug 'kabbamine/zeavim.vim'
    endif
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
        Plug 'SirVer/ultisnips' ,{ 'tag': '3.1'  }
        " Snippets are separated from the engine
        Plug 'honza/vim-snippets'
    endif

    if v:version < 800
        let g:plugin_coc_enable = 0
    endif
    if g:plugin_coc_enable == 1
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    endif

    " AutoPairs 自动匹配括号
    Plug 'jiangmiao/auto-pairs'
    " AutoFormat 格式化
    Plug 'Chiel92/vim-autoformat'

    " 模板
    Plug 'aperezdc/vim-template'

    " Show Diff
    Plug 'mhinz/vim-signify'

    " Syntax Check 语法检测
    Plug 'dense-analysis/ale'

    " Menu Plug
    Plug 'skywind3000/quickmenu.vim'

    Plug 'Shougo/echodoc.vim'
    "tmux support 
    Plug 'benmills/vimux'

    " Pig Support
    Plug 'motus/pig.vim'


    if has('nvim')
      Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/denite.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif


    if g:plugin_ranger_enable == 1
        Plug 'ranger/ranger'
        Plug 'francoiscabrol/ranger.vim'
    endif
    " nvim only pluin list
    if has("nvim")
        "python high light
        Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
        if g:plugin_ranger_enable == 1
            " for nvim ranger support dep
            Plug 'rbgrouleff/bclose.vim'
        endif
    endif

    " python dev
    " anaconda support
    "Plug 'cjrh/vim-conda'
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'luzhlon/xmake.vim'




call plug#end()

