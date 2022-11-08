autocmd VimEnter * :call InitFunc()
function! InitFunc()
    if !isdirectory(stdpath('data') . '/site/pack/packer/start/packer.nvim/')
        execute '!git clone --depth 1 https://github.com/wbthomason/packer.nvim
                    \ ~/.local/share/nvim/site/pack/packer/start/packer.nvim'
        autocmd VimEnter * PackerSync
        autocmd VimEnter * source $MYVIMRC
        exec '!pip install autopep8 -y'
        exec '!pip install pynvim -y'
    endif
endfunction

exec 'source $HOME/.config/nvim/static.vim'
" 加载插件
exec 'source $HOME/.config/nvim/plugin/plug-config.vim'
exec 'source $HOME/.config/nvim/plugin/floaterm-vim.vim'
" exec 'source $HOME/.config/nvim/plugin/coc_nvim.vim'
lua require("plugins")
lua require("lsp")
lua require("surface")
lua require("inits")

" 代码折叠
function FoldConfig()
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
endfunction
autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()

" 安装依赖
nnoremap <F3> :call InstallRely()<CR>
func! InstallRely()
    exec '!pip install autopep8 -y'
    exec '!pip install pynvim -y'
    exec 'call TeleRely()'
    " exec 'call NvimSet()'
    " exec 'call CocInstal()'
endfunc

" 格式化代码
nnoremap <silent><space>fc :call FormatCode()<CR>
func! FormatCode()
    exec "w"
    if &filetype=='python'
        exec ":Isort"
        exec "!autopep8 --in-place --aggressive --aggressive %"
    endif
endfunc
