" override cli location in .vimrc like this (if not in $PATH)
" let g:race_cli_command = "/home/foo/bin/cli" 
" 
" Upon first execution of RaceCliStart, the current buffer name will be used
" and stored for further invocation in race_start_sm. To override and start
" another state machine, use:
" let g:race_start_sm = "some_skill"

if !exists("g:race_cli_command")
    let g:race_cli_command = "cli"
endif

function! RaceCliUpload()
    set errorformat=%EError\ parsing\ .race\ format:\ %m,%Z\	at\ location\ %f:%l:%c,%C\ %#context:,%C,%C%.%#,%C%.%#,%Z%p^
    cexpr system(g:race_cli_command . " upload " . bufname("%"))
    caddexpr ''
    cwindow
endfunction

function! RaceCliStart()
    if !exists("g:race_start_sm")
      let g:race_start_sm = expand('%:t:r')
    endif
    silent !clear
    execute "!" . g:race_cli_command . " start " . g:race_start_sm
endfunction

function! RaceCliStartCurrent()
    silent !clear
    execute "!" . g:race_cli_command . " start " . expand('%:t:r')
endfunction

function! RaceCliStop()
    silent !clear
    execute "!" . g:race_cli_command . " stop "
endfunction

function! RaceCliFmt()
    let formatted = system(g:race_cli_command . " fmt " . bufname("%") . " 2>&1")
    normal! ggdG
    call append(0, split(formatted, '\v\n'))
endfunction

nnoremap <buffer> <localleader>u :call RaceCliUpload()<cr>
nnoremap <buffer> <localleader>s :call RaceCliStart()<cr>
nnoremap <buffer> <localleader>S :call RaceCliStartCurrent()<cr>
nnoremap <buffer> <localleader>p :call RaceCliStop()<cr>
nnoremap <buffer> <localleader>f :call RaceCliFmt()<cr>
