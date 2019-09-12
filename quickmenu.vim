" clear all the items
call quickmenu#reset()

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"

" use your favorite key to show / hide quickmenu
noremap <silent><F12> :call quickmenu#toggle(0)<CR>


" new section: empty action with text starts with "#" represent a new section
call quickmenu#append("# Debug", '')

" script between %{ and } will be evaluated before menu open
call quickmenu#append("Run %{expand('%:t')}", '!./%', "Run current file")

" YCM
call quickmenu#append("# You Complete Me", '')
call quickmenu#append("GoToDeclaration", "YcmCompleter GoToDeclaration", "GoToDeclaration leader gl")
call quickmenu#append("GoToDefinition", "YcmCompleter GoToDefinition", "GoToDefinition leader gf")
call quickmenu#append("GoToDefinitionElseDeclaration", "YcmCompleter GoToDefinitionElseDeclaration", "GoToDefinitionElseDeclaration leader gg")
call quickmenu#append("GoToPrev", "<C>+O", "Jump Prev")
call quickmenu#append("GoToNext", "<C>+I", "Jump Next")




" new section
call quickmenu#append("# Git", '')

" use fugitive to show diff
call quickmenu#append("git diff", 'Gvdiff', "use fugitive's Gvdiff on current document")

call quickmenu#append("git status", 'Gstatus', "use fugitive's Gstatus on current document")


" new section
call quickmenu#append("# Misc", '')
call quickmenu#append("Turn paste %{&paste? 'off':'on'}", "set paste!", "enable/disable paste mode (:set paste!)")
call quickmenu#append("Turn spell %{&spell? 'off':'on'}", "set spell!", "enable/disable spell check (:set spell!)")
call quickmenu#append("Function List", "TagbarToggle", "Switch Tagbar on/off")


if isdirectory(expand("~/.vim/bundle/markdown-preview.vim/"))
    "    map <Leader>md :MarkdownPreview<CR>
    if &filetype == 'markdown'
        call quickmenu#append("# Markdown", '')
        call quickmenu#append("MarkdownPreview", "MarkdownPreview", "Open Browser for markdown review")
    endif
endif


if isdirectory(expand("~/.vim/bundle/a.vim"))
    if &filetype == 'cpp'
        call quickmenu#append("# Cpp", '')
        call quickmenu#append("SwitchSourceHeader", "A", "switch source header <F9>")
    endif
endif
