" override ride location in .vimrc like this (if not in $PATH)
" let g:ride_command = "/home/foo/bin/ride"
"
" Upon first execution of RIDEStart, the current buffer name will be used
" and stored for further invocation in ride_start. To override and start
" another state machine, use:
" let g:ride_start = "some_statemachine"

if !exists("g:ride_command")
    let g:ride_command = "ride"
endif

function! RIDEStart()
    if !exists("g:ride_start")
      let g:ride_start = expand('%:t:r')
    endif
    silent !clear
    execute "!" . g:ride_command . " cli start " . g:ride_start
endfunction

function! RIDEStartCurrent()
    silent !clear
    execute "!" . g:ride_command . " cli start " . expand('%:t:r')
endfunction

function! RIDEStop()
    silent !clear
    execute "!" . g:ride_command . " stop "
endfunction

nnoremap <buffer> <localleader>s :call RIDEStart()<cr>
nnoremap <buffer> <localleader>S :call RIDEStartCurrent()<cr>
nnoremap <buffer> <localleader>p :call RIDEStop()<cr>
