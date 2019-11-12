func! Compile_Run_Code()
  exec 'w'
  if &filetype == 'c'
    if WINDOWS()
      exec '!gcc -Wall -std=c11 -o %:r %:t && %:r.exe'
    else
      exec '!gcc -Wall -std=c11 -o %:r.out %:t && ./%:r.out && rm ./%:r.out'
    endif
  elseif &filetype == 'cpp'
    if WINDOWS()
      exec '!g++ -Wall -std=c++11 -o %:r %:t && %:r.exe'
    else
      exec '!g++ -Wall -std=c++11 -o /tmp/%:r.out %:t && /tmp/%:r.out && rm /tmp/%:r.out'
    endif
  elseif &filetype == 'objc'
    if OSX()
      exec '!clang -fobjc-arc -framework Foundation %:t -o %:r && ./%:r'
    endif
  elseif &filetype == 'swift'
    if OSX()
      exec '!swift %:t'
    endif
 elseif &filetype == 'go'
    if WINDOWS()
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
endfunction

" run and compile
imap <F5> <esc>:call Compile_Run_Code()<cr>
nmap <F5> :call Compile_Run_Code()<cr>
vmap <F5> <esc>:call Compile_Run_Code()<cr>
