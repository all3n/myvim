"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  all3n vimrc simple
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/all3n/vim-plug/gitclone/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white


" show tab
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.


set nospell
set number
"set foldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" visual shift
vnoremap < <gv
vnoremap > >gv


" common map 
map <leader>ax :!chmod a+x %<cr><cr>
set pastetoggle=<F4>
map <leader>f ggVG=
map <F6> ggVG=


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


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line

set statusline=
set statusline+=%1*\ %<%F\                                "文件路径
set statusline+=%7*\[%{ModeInfo()}]                       "文件路径
set statusline+=%2*\ %y\                                  "文件类型
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "编码1
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "编码2
set statusline+=%4*\ %{&ff}\                              "文件系统(dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "语言 & 是否高亮，H表示高亮?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "光标所在行号/总行数 (百分比)
set statusline+=%9*\ col:%03c\                            "光标所在列
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Read only? Top/bottom
set statusline+=%7*\[Buffer:%n]                                  "buffernr
function! HighlightSearch()
      if &hls
          return 'H'
      else
          return ''
      endif
endfunction


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
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>


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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Color Schema http://vimcolors.com/596/minimalist/dark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set background=dark
"if version > 580
""    hi clear
"    if exists("syntax_on")
"        syntax reset
"    endif
"endif
"set t_Co=256
"let g:colors_name = "minimalist"
"
"hi User1 ctermfg=white  ctermbg=35
"hi User2 ctermfg=51  ctermbg=35
"hi User3 ctermfg=11  ctermbg=35
"hi User4 ctermfg=11  ctermbg=31
"hi User5 ctermfg=11  ctermbg=32
"hi User7 ctermfg=white  ctermbg=36  cterm=bold
"hi User8 ctermfg=white  ctermbg=33
"hi User9 ctermfg=white  ctermbg=34
"hi User0 ctermfg=yellow  ctermbg=35



"""""""""""""""""""""""
" General
"""""""""""""""""""""""
"hi ColorColumn      ctermfg=NONE    ctermbg=233     cterm=NONE      guifg=NONE          guibg=#121212   gui=NONE
"hi Cursor           ctermfg=234     ctermbg=255     cterm=NONE      guifg=#1C1C1C       guibg=#EEEEEE   gui=NONE
"hi CursorColumn     ctermfg=NONE    ctermbg=233     cterm=NONE      guifg=NONE          guibg=#121212   gui=NONE
"hi CursorLine       ctermfg=NONE    ctermbg=240     cterm=NONE      guifg=NONE          guibg=#121212   gui=NONE
"hi DiffAdd          ctermfg=255     ctermbg=64      cterm=bold      guifg=#EEEEEE       guibg=#5F8700   gui=bold
"hi DiffChange       ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=NONE          guibg=NONE      gui=NONE
"hi DiffDelete       ctermfg=167     ctermbg=NONE    cterm=NONE      guifg=#D75F5F       guibg=NONE      gui=NONE
"hi DiffText         ctermfg=255     ctermbg=24      cterm=bold      guifg=#EEEEEE       guibg=#005F87   gui=bold
"hi Directory        ctermfg=179     ctermbg=NONE    cterm=NONE      guifg=#D7AF5F       guibg=NONE      gui=NONE
"hi ErrorMsg         ctermfg=255     ctermbg=167     cterm=NONE      guifg=#EEEEEE       guibg=#D75F5F   gui=NONE
"hi Folded           ctermfg=242     ctermbg=234     cterm=NONE      guifg=#666666       guibg=#1C1C1C   gui=NONE
"hi IncSearch        ctermfg=234     ctermbg=75      cterm=NONE      guifg=#1C1C1C       guibg=#5FAFFF   gui=NONE
"hi LineNr           ctermfg=254      ctermbg=235     cterm=NONE      guifg=#5F5F5F       guibg=#262626   gui=NONE
"hi MatchParen       ctermfg=NONE    ctermbg=NONE    cterm=underline guifg=NONE          guibg=NONE      gui=underline
"hi NonText          ctermfg=234     ctermbg=234     cterm=NONE      guifg=#1C1C1C       guibg=#1C1C1C   gui=NONE
"hi Normal           ctermfg=255     ctermbg=234     cterm=NONE      guifg=#EEEEEE       guibg=#1C1C1C   gui=NONE
"hi Pmenu            ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=NONE          guibg=NONE      gui=NONE
"hi PmenuSel         ctermfg=NONE    ctermbg=59      cterm=NONE      guifg=NONE          guibg=#5F5F5F   gui=NONE
"hi Search           ctermfg=NONE    ctermbg=NONE    cterm=underline guifg=NONE          guibg=NONE      gui=underline
"hi SignColumn       ctermfg=NONE    ctermbg=237     cterm=NONE      guifg=NONE          guibg=#3A3A3A   gui=NONE
"hi StatusLine       ctermfg=255     ctermbg=241     cterm=bold      guifg=#EEEEEE       guibg=#606060   gui=bold
"hi StatusLineNC     ctermfg=255     ctermbg=241     cterm=NONE      guifg=#EEEEEE       guibg=#606060   gui=NONE
"hi Title            ctermfg=255     ctermbg=NONE    cterm=NONE      guifg=#EEEEEE       guibg=NONE      gui=NONE
"hi Underlined       ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=NONE          guibg=NONE      gui=NONE
"hi VertSplit        ctermfg=241     ctermbg=241     cterm=NONE      guifg=#606060       guibg=#606060   gui=NONE
"hi Visual           ctermfg=NONE    ctermbg=246     cterm=NONE      guifg=NONE          guibg=#303030   gui=NONE
"hi WarningMsg       ctermfg=255     ctermbg=167     cterm=NONE      guifg=#EEEEEE       guibg=#D75F5F   gui=NONE
"
""""""""""""""""""""""""
"" Syntax Highlighting
""""""""""""""""""""""""
"hi Boolean          ctermfg=39     ctermbg=NONE    cterm=NONE      guifg=#D7875F       guibg=NONE      gui=NONE
"hi Character        ctermfg=39     ctermbg=NONE    cterm=NONE      guifg=#AF87D7       guibg=NONE      gui=NONE
"hi Comment          ctermfg=41     ctermbg=NONE    cterm=NONE      guifg=#444444       guibg=NONE      gui=NONE
"hi Conditional      ctermfg=39     ctermbg=NONE    cterm=NONE      guifg=#AF87D7       guibg=NONE      gui=NONE
"hi Constant         ctermfg=39     ctermbg=NONE    cterm=NONE      guifg=#AF87D7       guibg=NONE      gui=NONE
"hi Define           ctermfg=39     ctermbg=NONE    cterm=NONE      guifg=#AF87D7       guibg=NONE      gui=NONE
"hi Float            ctermfg=39     ctermbg=NONE    cterm=NONE      guifg=#AF87D7       guibg=NONE      gui=NONE
"hi Function         ctermfg=74      ctermbg=NONE    cterm=NONE      guifg=#5FAFD7       guibg=NONE      gui=NONE
"hi Identifier       ctermfg=255     ctermbg=NONE    cterm=NONE      guifg=#EEEEEE       guibg=NONE      gui=italic
"hi Keyword          ctermfg=14     ctermbg=NONE    cterm=NONE      guifg=#AF87D7       guibg=NONE      gui=NONE
"hi Label            ctermfg=186     ctermbg=NONE    cterm=NONE      guifg=#D7D787       guibg=NONE      gui=NONE
"hi Number           ctermfg=39     ctermbg=NONE    cterm=NONE      guifg=#D7875F       guibg=NONE      gui=NONE
"hi Operator         ctermfg=117     ctermbg=NONE    cterm=NONE      guifg=#87D7FF       guibg=NONE      gui=NONE
"hi PreProc          ctermfg=39     ctermbg=NONE    cterm=NONE      guifg=#AF87D7       guibg=NONE      gui=NONE
"hi Repeat           ctermfg=153     ctermbg=NONE    cterm=NONE      guifg=#AF87D7       guibg=NONE      gui=NONE
"hi Special          ctermfg=117     ctermbg=NONE    cterm=NONE      guifg=#87D7FF       guibg=NONE      gui=NONE
"hi SpecialComment   ctermfg=242     ctermbg=NONE    cterm=NONE      guifg=#666666       guibg=NONE      gui=NONE
"hi SpecialKey       ctermfg=59      ctermbg=237     cterm=NONE      guifg=#5F5F5F       guibg=#3A3A3A   gui=NONE
"hi Statement        ctermfg=87     ctermbg=NONE    cterm=NONE      guifg=#D75F5F       guibg=NONE      gui=NONE
"hi StorageClass     ctermfg=215     ctermbg=NONE    cterm=NONE      guifg=#FFAF5F       guibg=NONE      gui=italic
"hi String           ctermfg=10     ctermbg=NONE    cterm=NONE      guifg=#AFD787       guibg=NONE      gui=NONE
"hi Structure        ctermfg=215     ctermbg=NONE    cterm=NONE      guifg=#FFAF5F       guibg=NONE      gui=NONE
"hi Tag              ctermfg=39     ctermbg=NONE    cterm=NONE      guifg=#AF87D7       guibg=NONE      gui=NONE
"hi Todo             ctermfg=74      ctermbg=234     cterm=inverse   guifg=#5FAFD7       guibg=#1C1C1C   gui=inverse,bold
"hi Type             ctermfg=123     ctermbg=NONE    cterm=NONE      guifg=#AF87D7       guibg=NONE      gui=NONE
"
""""}}}





call plug#begin('~/.config/nvim/plugged')
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/a.vim'

" python syntax highlight
" pip3 install pynvim --upgrade 
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'


" search plugin

Plug 'ranger/ranger'
Plug 'francoiscabrol/ranger.vim'


Plug 'majutsushi/tagbar'


Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf'

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" https://github.com/neoclide/coc.nvim/wiki/Language-servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()



" nerdtree-git-plugin {
if isdirectory(expand("~/.vim/plugged/nerdtree/"))
autocmd vimenter * NERDTree

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" shortcut
map <C-E> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIgnore = ['\.pyc$','\.o$', '\.d$']

" define arrow symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
endif
" }
"
"








if isdirectory(expand("~/.vim/plugged/molokai"))
    colorscheme molokai
endif

if isdirectory(expand("~/.vim/plugged/a"))
    nnoremap <silent> <F9> :A<CR>
endif
noremap <leader>g :Ag<CR>



if isdirectory(expand("~/.vim/plugged/coc.nvim"))

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
  inoremap <silent><expr> <c-]> coc#refresh()
else
  inoremap <silent><expr> <c-]> coc#refresh()
endif



" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



endif
