"    #     # #     # #     # ### #     # 
"    ##   ##  #   #  #     #  #  ##   ## 
"    # # # #   # #   #     #  #  # # # # 
"    #  #  #    #    #     #  #  #  #  # 
"    #     #    #     #   #   #  #     # 
"    #     #    #      # #    #  #     # 
"    #     #    #       #    ### #     # 

" General {
    " Sets how many lines of history VIM has to remember
    set history=700
    " Enable filetype plugins
    filetype plugin on
    filetype indent on
    set nocompatible
    " Set to auto read when a file is changed from the outside
    set autoread
    " With a map leader it's possible to do extra key combinations
    " like <leader>w saves the current file
    let mapleader = ","
    let g:mapleader = ","
    " Fast saving
    nmap <leader>w :w!<cr>
    "cmap w!! w !sudo tee % >/dev/null
    nmap <leader>sudo :w !sudo tee % >/dev/null<cr>
    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8
    scriptencoding utf-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,latin1
    " Use Unix as the standard file type
    set ffs=unix,dos,mac

    autocmd InsertLeave * se nocul
    autocmd InsertEnter * se cul
    set nocompatible              " be iMproved, required
    filetype off                  " required


    "设置切换Buffer快捷键"
    nnoremap <C-N> :bn<CR>
    nnoremap <C-M> :bp<CR>

    filetype plugin indent on     " required
" }

" env {
    au BufRead,BufNewFile *.h        setlocal ft=c
    au BufRead,BufNewFile *.i        setlocal ft=c
    au BufRead,BufNewFile *.m        setlocal ft=objc
    au BufRead,BufNewFile *.di       setlocal ft=d
    au BufRead,BufNewFile *.ss       setlocal ft=scheme
    au BufRead,BufNewFile *.lsp      setlocal ft=newlisp
    au BufRead,BufNewFile *.cl       setlocal ft=lisp
    au BufRead,BufNewFile *.phpt     setlocal ft=php
    au BufRead,BufNewFile *.inc      setlocal ft=php
    au BufRead,BufNewFile *.cson     setlocal ft=coffee
    au BufRead,BufNewFile *.sql      setlocal ft=mysql
    au BufRead,BufNewFile *.tpl      setlocal ft=smarty
    au BufRead,BufNewFile *.txt      setlocal ft=txt
    au BufRead,BufNewFile *.log      setlocal ft=conf
    au BufRead,BufNewFile hosts      setlocal ft=conf
    au BufRead,BufNewFile *.conf     setlocal ft=dosini
    au BufRead,BufNewFile http*.conf setlocal ft=apache
    au BufRead,BufNewFile nginx.conf setlocal ft=nginx
    au BufRead,BufNewFile *.ini      setlocal ft=dosini
" }

" Platform {
    silent function! OSX()
        return has('macunix')
    endfunction
    silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
        return  (has('win32') || has('win64'))
    endfunction
" }

" Platform Compatible{
    if WINDOWS()
        set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/ vimfiles/after,$HOME/.vim/after
        endif
" }

" VIM user interface {
    " Set 7 lines to the cursor - when moving vertically using j/k
    set so=7
    " Turn on the WiLd menu
    set wildmenu
    set wildmode=list:full
    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc
    "Always show current position
    set ruler
    " Height of the command bar
    set cmdheight=2
    " A buffer becomes hidden when it is abandoned
    set hid
    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l
    " Ignore case when searching
    set ignorecase
    " When searching try to be smart about cases 
    set smartcase
    " Highlight search results
    set hlsearch
    " Makes search act like search in modern browsers
    set incsearch 
    " Don't redraw while executing macros (good performance config)
    set lazyredraw 
    " For regular expressions turn magic on
    set magic
    " Show matching brackets when text indicator is over them
    set showmatch
    " How many tenths of a second to blink when matching brackets
    set mat=2
    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500
    set cursorline
    hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
    " set cursorcolumn
    " hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
    " show tab
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
    set nospell
    set number
" }

" Colors and Fonts {
    " Enable syntax highlighting
    syntax enable 

    if has('win32')
      set guifont=Hermit:h13
      set guifontwide=Microsoft_YaHei_Mono:h12
    endif
" }

"  Files, backups and undo {
" Turn backup off, since most stuff is in SVN, git et.c anyway...
    set nobackup
    set nowb
" }

" Text, tab and indent related {
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
"}

" Visual mode related {
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

" visual shift
    vnoremap < <gv
    vnoremap > >gv

" }

" common map {
    map <leader>ax :!chmod a+x %<cr><cr>
    set pastetoggle=<F4>
    map <leader>f ggVG=
    map <F6> ggVG=
" }

" Moving around, tabs, windows and buffers {
    " Treat long lines as break lines (useful when moving around in them)
    map j gj
    map k gk


    " Disable highlight when <leader><cr> is pressed
    map <silent> <leader><cr> :noh<cr>

    " Smart way to move between windows
    "map <C-j> <C-W>j
    "map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " Close the current buffer
    map <leader>bd :Bclose<cr>

    " Close all the buffers
    map <leader>ba :1,1000 bd!<cr>

    " Useful mappings for managing tabs
    map <leader>tn :tabnew<cr>
    map <leader>to :tabonly<cr>
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove


    nnoremap <F3> :tabnext<CR> 
    nnoremap <F2> :tabprev<CR> 

    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>

    " Specify the behavior when switching between buffers 
    try
      set switchbuf=useopen,usetab,newtab
      set stal=2
    catch
    endtry

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
    " Remember info about open buffers on close
    set viminfo^=%

" }

" Editing mappings {
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
"}

" vimgrep searching and cope displaying {
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>
"}

" Spell checking {
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" }

" Misc {
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
map <leader>tt :%retab!<cr>

" }

" Helper functions {

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" model info
function! ModeInfo()
    let m = mode()
    let md = m
    if m == "n"
        let md = "Normal"
    elseif m == "v" || m == "V"
        let md = "Visual"
    elseif m == "i"
        let md = "Insert"
    elseif m == "R"
        let md = "Replace"
    elseif m == "c"
        let md = "Command"
    else
        let md = m
    endif
    if &paste
        return md.":PASTE"
    else
        return md
    endif
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" }

" fold setting {
    set foldenable
    set foldmethod=syntax
    set foldmethod=marker
    set foldmarker={,}
    setlocal foldlevel=1        " 设置折叠层数为
    set foldlevelstart=99      " 打开文件是默认不折叠代码
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠
" }

" Clever Tab tips {
    function! CleverTab()
       if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
          return "\<Tab>"
       else
          return "\<C-N>"
       endif
    endfunction
    "inoremap <Tab> <C-R>=CleverTab()<CR>
" }



" load plugin conf {
if filereadable(expand("~/myvim/plugin_vundle.vim"))
    source ~/myvim/plugin_vundle.vim
endif

if filereadable(expand("~/myvim/plugin_config.vim"))
    " update plugins: vim +PluginInstall +qall
    source ~/myvim/plugin_config.vim
endif
" }

" Load Compile Config {
if filereadable(expand("~/myvim/compile.vim"))
    source ~/myvim/compile.vim
endif
" }



