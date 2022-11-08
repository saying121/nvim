" 自动导入包ALT enter
nmap<silent> <M-CR>   :ImportSymbol<CR>
imap <silent> <M-CR>   <Esc>:ImportSymbol<CR>a

" Telescope
func! TeleRely()
    exec '!apt install ripgrep -y'
endfunc

" translator
nnoremap <M-y> <Plug>TranslateW
vnoremap <M-y> <Plug>TranslateWV
" Available: 'bing', 'google', 'haici', 'iciba'(expired), 'sdcv', 'trans', 'youdao'
let g:translator_default_engines=['bing','haici']
" """ Configuration example
" " Echo translation in the cmdline
" nmap <silent> <Leader>t <Plug>Translate
" vmap <silent> <Leader>t <Plug>TranslateV
" " Display translation in a window
" nmap <silent> <Leader>w <Plug>TranslateW
" vmap <silent> <Leader>w <Plug>TranslateWV
" " Replace the text with translation
" nmap <silent> <Leader>r <Plug>TranslateR
" vmap <silent> <Leader>r <Plug>TranslateRV
" " Translate the text in clipboard
" nmap <silent> <Leader>x <Plug>TranslateX
