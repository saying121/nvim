exec 'source $HOME/.config/nvim/static.vim'
" 加载插件
exec 'source $HOME/.config/nvim/plugin/coc_nvim.vim'
exec 'source $HOME/.config/nvim/plugin/plugConfig.vim'
lua require("plugins")
lua require("dashboard-config")
lua require("surface-plugin-config")
lua require("nvim-treesitter-config")
lua require("nvim-tree-config")
lua require("project-nvim-config")
lua require("dap-nvim-config")
lua require("aerial-config")

" 代码折叠
function FoldConfig()
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
endfunction
autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()

" 安装依赖
nnoremap <F3> :call InstallRely()<CR>
func! InstallRely()
    exec 'call NvimSet()'
    exec 'call CocInstal()'
    exec '!apt install astyle -y'
    exec '!pip install autopep8 -y'
    exec '!pip install pynvim -y'
    exec 'call TeleRely()'
endfunc

" 格式化代码
nnoremap <silent><leader>fc :call FormatCode()<CR>
func! FormatCode()
    exec "w"
    if &filetype=='c'||
                \&filetype=='cpp'||
                \&filetype=='java'
        exec "!astyle --style=allman %"
    elseif &filetype=='lua'
        exec "!astyle --style=java %"
    elseif &filetype=='python'
        exec ":Isort"
        exec "!autopep8 --in-place --aggressive --aggressive %"
    endif
endfunc
