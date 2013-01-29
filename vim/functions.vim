function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
nnoremap <Leader>n :call NumberToggle()<CR>

" Paste to sprunge.us, the best paste site by rupa.
let s:cmd = system("uname -s | tr -d '\n'") == "Darwin" ? "pbcopy" : "xclip"
exec 'command! -range=% Share :<line1>,<line2>write !curl -sF "sprunge=<-" http://sprunge.us|'.s:cmd
