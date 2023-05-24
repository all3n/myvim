"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  all3n vimrc simple
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

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

cmap w!! w !sudo tee % >/dev/null

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,latin1

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM ENV
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file type
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


" OS TYPE
if(has('win32') || has('win64'))
    let g:isWIN = 1
    let g:isMAC = 0
else
    if system('uname') =~ 'Darwin'
        let g:isWIN = 0
        let g:isMAC = 1
    else
        let g:isWIN = 0
        let g:isMAC = 0
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
hi CursorLine cterm=NONE ctermbg=grey guibg=grey
"set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=lightgrey guibg=lightgrey
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>


" show tab
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set nospell
set number
"set foldenable

syntax enable 
colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif


set nobackup
set nowb
set noswapfile


set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines



" jumper forward word
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" visual shift
vnoremap < <gv
vnoremap > >gv

" common map 
map <leader>ax :!chmod a+x %<cr><cr>
set pastetoggle=<F4>
map <leader>ff ggVG=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk


" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
map <leader>tt :%retab!<cr>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul



" fold setting
" set foldmethod=syntax
" set foldmethod=marker
" set foldmarker={,} 
" set foldlevel=0 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clever Tab tips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! CleverTab()
    "if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        "return "\<Tab>"
    "else
        "return "\<C-N>"
    "endif
"endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Compile Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Compile_Run_Code()
    exec 'w'
    if &filetype == 'c'
        if g:isWIN
            exec '!gcc -Wall -std=c11 -o %:r %:t && %:r.exe'
        else
            exec '!gcc -Wall -std=c11 -o %:r.out %:t && ./%:r.out && rm ./%:r.out'
        endif
    elseif &filetype == 'cpp'
        if g:isWIN
            exec '!g++ -Wall -std=c++11 -o %:r %:t && %:r.exe'
        else
            exec '!g++ -Wall -std=c++11 -o %:r.out %:t && ./%:r.out && rm ./%:r.out'
        endif
    elseif &filetype == 'objc'
        if g:isMAC
            exec '!clang -fobjc-arc -framework Foundation %:t -o %:r && ./%:r'
        endif
    elseif &filetype == 'swift'
        if g:isMAC
            exec '!swift %:t'
        endif
    elseif &filetype == 'go'
        if g:isWIN
            exec '!go build %:t && %:r.exe'
        else
            exec '!go build %:t && ./%:r'
        endif
    elseif &filetype == 'java'
        exec '!javac %:t && java %:r && rm %:r.class'
    elseif &filetype == 'groovy'
        exec '!groovy %:t'
    elseif &filetype == 'scala'
        exec '!scala %:t'
    elseif &filetype == 'lua'
        exec '!lua %:t'
    elseif &filetype == 'perl'
        exec '!perl %:t'
    elseif &filetype == 'php'
        exec '!php %:t'
    elseif &filetype == 'python'
        exec '!/usr/bin/env python %:t'
    elseif &filetype == 'ruby'
        exec '!ruby %:t'
    elseif &filetype == 'javascript'
        exec '!node %:t'
    elseif &filetype == 'coffee'
        exec '!coffee -c %:t && node %:r.js'
    elseif &filetype == 'r'
        exec '!Rscript %:t'
    elseif &filetype == 'sh'
        exec '!bash %:t'
    endif
endfunc

" run and compile
imap <F5> <esc>:call Compile_Run_Code()<cr>
nmap <F5> :call Compile_Run_Code()<cr>
vmap <F5> <esc>:call Compile_Run_Code()<cr>


call plug#begin('~/.vim/plugged')
" tree devicons support
Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdcommenter'
" themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" find plugins
Plug 'kien/ctrlp.vim'

" snip
if v:version < 703
    " only 5.0.0 compatible for 7.2
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle', 'tag': '5.0.0' }
    Plug 'SirVer/ultisnips', {'tag' : '3.0'}
    " v2.7 for 7.0
    Plug 'preservim/tagbar', {'tag': 'v2.7'}
elseif v:version > 800
    Plug 'preservim/nerdtree'
    Plug 'SirVer/ultisnips'
    Plug 'preservim/tagbar'
endif

Plug 'honza/vim-snippets'

Plug 'vim-scripts/a.vim'
Plug 'ervandew/supertab'

" Plug 'preservim/vimux'

call plug#end()

let g:airline_theme='molokai'


nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>tt :TagbarToggle<CR>

" A.vim switch header/source
nnoremap <leader>th :A<CR>

" ctrlp map
let g:ctrlp_map = '<c-p>'

" https://github.com/preservim/nerdcommenter
" [count]<leader>c<space> |NERDCommenterToggle|

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:webdevicons_conceal_nerdtree_brackets=0
