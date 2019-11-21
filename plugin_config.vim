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
    set tags+=~/.vim/systags
    let ext_tags = glob("~/.vim/tags/*.tags", v:false, v:true)
    for ext_tag in ext_tags
        exec "set tags+=".ext_tag
    endfor

    let app_tags_file = getcwd()."/tagsfile"
    if filereadable(app_tags_file)
        for tagfile in readfile(app_tags_file)
            let abstagfile = expand(tagfile)
            if filereadable(abstagfile)
                exec "set tags+=".expand(abstagfile)
            endif
        endfor
    endif
endif
" }

" cscope {
  if has("cscope")
      set csprg=cscope
      set csto=0
      set cst
      set nocsverb
      " add any database in current directory
      if filereadable("cscope.out")
          cs add cscope.out
      " else add database pointed to by environment
      elseif $CSCOPE_DB != ""
          cs add $CSCOPE_DB
      endif
      set csverb
  endif
" }

" plugin tagbar {
if isdirectory(expand("~/.vim/plugged/tagbar"))
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
endif
" }

" YouCompleteMe {
if g:plugin_ycm_enable == 1 && isdirectory(expand("~/.vim/plugged/YouCompleteMe"))
    let g:ycm_key_invoke_completion = '<C-l>'
    let g:ycm_global_ycm_extra_conf = '~/myvim/.ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf = 0
    set completeopt=longest,menu
    "autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    "inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
    let g:ycm_enable_diagnostic_signs = 0
    let g:ycm_enable_diagnostic_highlighting = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 0

    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_complete_in_comments = 0
    let g:ycm_complete_in_strings = 0
    let g:ycm_min_num_of_chars_for_completion = 2
    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

    "let g:ycm_keep_logfiles = 1
    "let g:ycm_log_level = 'debug'
    "往前跳和往后跳的快捷键为Ctrl+O以及Ctrl+I
endif
" }

" a.vim Source/Header Toggle {
" switch .c and .h
    if isdirectory(expand("~/.vim/plugged/a.vim"))
        nnoremap <silent> <F9> :A<CR>
    endif
" }

" Tabularize {
    if isdirectory(expand("~/.vim/plugged/tabular"))
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
    if g:plugin_ultisnips_enable == 1 && isdirectory(expand("~/.vim/plugged/ultisnips"))
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
    endif
" }


" ColorSchema Monkai {
    if isdirectory(expand("~/.vim/plugged/molokai"))
        colorscheme molokai
    endif
" }

" AutoFormat {
    if isdirectory(expand("~/.vim/plugged/vim-autoformat/"))
        " python format sytle
        " you should install yapf first:pip install --user yapf
        let g:formatter_yapf_style = 'pep8'
        noremap <F8> :Autoformat<CR>

        "au BufWrite * :Autoformat

        let g:autoformat_autoindent = 0
        let g:autoformat_retab = 0
        let g:autoformat_remove_trailing_spaces = 0

        autocmd FileType vim,tex let b:autoformat_autoindent=0
    endif
" }


" Ale  Syntax Check {
if isdirectory(expand("~/.vim/plugged/ale/"))
    " Check Python files with flake8 and pylint.
    let b:ale_linters = ['flake8', 'pylint']
    " Fix Python files with autopep8 and yapf.
    let b:ale_fixers = ['autopep8', 'yapf']
    " Disable warnings about trailing whitespace for Python files.
    let b:ale_warn_about_trailing_whitespace = 0

    let g:airline#extensions#ale#enabled = 1
    "始终开启标志列
    let g:ale_sign_column_always = 1
    let g:ale_set_highlights = 0
    "自定义error和warning图标
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚡'
    "在vim自带的状态栏中整合ale
    let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
    "显示Linter名称,出错或警告等相关信息
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
    nmap sp <Plug>(ale_previous_wrap)
    nmap sn <Plug>(ale_next_wrap)
    "<Leader>s触发/关闭语法检查
    nmap <Leader>s :ALEToggle<CR>
    "<Leader>d查看错误或警告的详细信息
    nmap <Leader>ad :ALEDetail<CR>
    "文件内容发生变化时不进行检查
    " let g:ale_lint_on_text_changed = 'never'
    "打开文件时不进行检查
    " let g:ale_lint_on_enter = 0
endif

" YCM 参数显示增强插件
if g:plugin_ycm_enable == 1 && isdirectory(expand("~/.vim/plugged/CompleteParameter.vim/"))
    "let g:complete_parameter_log_level = 1
    inoremap <silent><expr> ( complete_parameter#pre_complete("()")
    smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
    smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
    imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

    let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
    inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
endif

" Markdown 浏览器预览插件
if isdirectory(expand("~/.vim/plugged/markdown-preview.vim/"))
    if OSX()
        let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
    elseif LINUX()
        let g:mkdp_path_to_chrome = "google-chrome"
    endif
    map <Leader>md :MarkdownPreview<CR>
endif

if isdirectory(expand("~/.vim/plugged/echodoc.vim/"))
    set cmdheight=2
    let g:echodoc_enable_at_startup = 1
endif


if isdirectory(expand("~/.vim/plugged/quickmenu.vim"))
    source ~/myvim/quickmenu.vim
endif



if isdirectory(expand("~/.vim/plugged/vimux"))
    nnoremap <leader>r :VimuxRunCommand("make")<CR>
    nnoremap <leader>l :VimuxRunLastCommand<CR>
endif

if g:plugin_jedi_enable == 1 && isdirectory(expand("~/.vim/plugged/jedi-vim"))
    let g:jedi#goto_command = "<leader>d"
    let g:jedi#goto_assignments_command = "<leader>g"
    let g:jedi#goto_definitions_command = ""
    let g:jedi#documentation_command = "K"
    let g:jedi#usages_command = "<leader>n"
    let g:jedi#completions_command = "<C-Space>"
    let g:jedi#rename_command = "<leader>r"
endif




if g:plugin_coc_enable == 1
    let g:coc_global_extensions = ['coc-python', 'coc-html', 'coc-json', 'coc-css', 'coc-lists', 'coc-gitignore']
endif
"set noshowmode

" }
