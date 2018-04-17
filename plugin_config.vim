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
" }

" YouCompleteMe {
if isdirectory(expand("~/.vim/bundle/YouCompleteMe"))
    let g:ycm_key_invoke_completion = '<C-i>'
    let g:ycm_global_ycm_extra_conf = '~/myvim/.ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf = 0
    set completeopt=longest,menu
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
    let g:ycm_enable_diagnostic_signs = 0
    let g:ycm_enable_diagnostic_highlighting = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 0
    let g:ycm_complete_in_comments = 0
    let g:ycm_complete_in_strings = 0
    let g:ycm_min_num_of_chars_for_completion = 2

    " for python
    if executable('/usr/bin/env python3')
        let g:ycm_python_binary_path = '/usr/bin/env python3'
    endif
    if executable('/usr/bin/env python')
        let g:ycm_python_binary_path = '/usr/bin/env python'
    endif
endif
" }

" a.vim Source/Header Toggle {
" switch .c and .h
    if isdirectory(expand("~/.vim/bundle/a.vim"))
        nnoremap <silent> <F9> :A<CR>
    endif
" }

" Tabularize {
    if isdirectory(expand("~/.vim/bundle/tabular"))
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
        vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
        nmap <Leader>a=> :Tabularize /=><CR>
        vmap <Leader>a=> :Tabularize /=><CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a,, :Tabularize /,\zs<CR>
        vmap <Leader>a,, :Tabularize /,\zs<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    endif
" }


" Snippets {
    if isdirectory(expand("~/.vim/bundle/ultisnips"))
        " fix Tab Conflict With YouCompleteMe
        " https://github.com/Valloric/YouCompleteMe/issues/36
        " https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
        function! g:UltiSnips_Complete()
          call UltiSnips#ExpandSnippet()
          if g:ulti_expand_res == 0
            if pumvisible()
              return "\<C-n>"
            else
              call UltiSnips#JumpForwards()
              if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
              endif
            endif
          endif
          return ""
        endfunction

        function! g:UltiSnips_Reverse()
          call UltiSnips#JumpBackwards()
          if g:ulti_jump_backwards_res == 0
            return "\<C-P>"
          endif

          return ""
        endfunction


        if !exists("g:UltiSnipsJumpForwardTrigger")
          let g:UltiSnipsJumpForwardTrigger = "<tab>"
        endif
        if !exists("g:UltiSnipsJumpBackwardTrigger")
          let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
        endif
        au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
        au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
    endif
" }


" ColorSchema Monkai {
    if isdirectory(expand("~/.vim/bundle/molokai"))
        colorscheme molokai
    endif
" }
