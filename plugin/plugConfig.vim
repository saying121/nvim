"
nnoremap <leader>e :NvimTreeToggle<CR>

" 自动导入包ALT enter
nmap<silent> <M-CR>   :ImportSymbol<CR>
imap <silent> <M-CR>   <Esc>:ImportSymbol<CR>a

" Telescope 设置
func! TeleRely()
    exec '!apt install ripgrep -y'
endfunc
nnoremap <leader>ff <Cmd>Telescope find_files<CR>
nnoremap <leader>lg <Cmd>Telescope live_grep<CR>
nnoremap <leader>bf <Cmd>Telescope buffers<CR>

" translator
nnoremap <M-y> <Plug>TranslateW
vnoremap <M-y> <Plug>TranslateWV
let g:translator_default_engines=['bing','haici']
