" nerdtree-git-plugin {
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
" }

" rainbow enable {
let g:rainbow_active = 1
" }

" dash config {
nmap <silent> <leader>d <Plug>DashSearch
" }


" airline {
    let g:airline_theme="molokai" 


    "打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1


    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#whitespace#symbol = '!'
" }

" ctags {
if executable("ctags")
    map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
    imap <F10> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
    set tags=tags
    set tags+=./tags "add current directory's generated tags file
    set tags+=~/.vim/cocostags
    set tags+=~/.vim/systags
endif
" }

" plugin tagbar {
if isdirectory(expand("~/.vim/bundle/tagbar"))
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
endif

