" Compile {
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
endfunction
" }
