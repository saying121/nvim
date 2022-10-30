func! CocInstal()
    exec '!apt install -y nodejs clangd'
    exec '!npm install npm -g -y'
    exec '!npm install -g -y yarn'
    exec '!cd $HOME/.local/share/nvim/site/pack/packer/start/coc.nvim | yarn install '
endfunc

" nvm install v(version)直接写nodejs版本号
" 到coc.nvim目录yarn install || yarn build

let g:coc_global_extensions=[
            \'coc-clangd',
            \'coc-java',
            \'coc-snippets',
            \'coc-tsserver',
            \'coc-pyright',
            \'coc-marketplace',
            \'coc-actions',
            \'coc-explorer',
            \'coc-css',
            \'coc-json']
set hidden
set updatetime=50
nmap <leader>a <Plug>(coc-codeaction)
"重构函数或重命名,会打开窗口预览
nmap <leader>rf <Plug>(coc-refactor)
"重命名所在位置符号
nmap <leader>rn <Plug>(coc-rename)
"找错
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)
"定义位置
nmap <silent>gd <Plug>(coc-definition)
"类型定义位置
nmap <silent>gy <Plug>(coc-type-definition)
"实现位置
nmap <silent>gi <Plug>(coc-implementation)
"引用位置
nmap <silent>gr <Plug>(coc-references)
"文件管理器
nmap <leader>e <Cmd>CocCommand explorer<CR>

"同词高亮
autocmd CursorHold * silent call CocActionAsync('highlight')
""选中更改
"xmap <CR> <Plug>(coc-codeaction)
" nmap <M-CR> <Plug>(coc-codeaction)
"集成statusline
function! StatusDiagnostic() abort
	  let info = get(b:, 'coc_diagnostic_info', {})
	  if empty(info) | return '' | endif
	  let msgs = []
	  if get(info, 'error', 0)
	    call add(msgs, 'E' . info['error'])
	  endif
	  if get(info, 'warning', 0)
	    call add(msgs, 'W' . info['warning'])
	  endif
	  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
	endfunction
" 大写k显示帮助文档
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction
" 补全
inoremap <silent><expr> z<space> coc#refresh()
" tab补全
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"enter确认
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
