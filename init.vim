autocmd VimEnter * :call InitFunc()
function! InitFunc()
    if !isdirectory(stdpath('data') . '/site/pack/packer/start/packer.nvim/')
        execute '!git clone --depth 1 https://github.com/wbthomason/packer.nvim
                    \ ~/.local/share/nvim/site/pack/packer/start/packer.nvim'
        autocmd VimEnter * source $MYVIMRC
        autocmd VimEnter * PackerSync
        autocmd VimEnter * source $MYVIMRC
        exec ':call InstallRely()'
        autocmd VimEnter * source $MYVIMRC
    endif
endfunction

exec 'source $HOME/.config/nvim/static.vim'
" 加载插件
exec 'source $HOME/.config/nvim/plugin/plug-config.vim'
exec 'source $HOME/.config/nvim/plugin/floaterm-vim.vim'
" 换coc再开启
" exec 'source $HOME/.config/nvim/plugin/coc_nvim.vim'
lua require("plugins")
lua require("lsp")
lua require("surface")
lua require("inits")

" 安装依赖
nnoremap <F3> :call InstallRely()<CR>
func! InstallRely()
    " exec '!pip install black'
    " exec '!pip install isort'
    " exec '!pip install pynvim'
    exec 'call TeleRely()'
    exec 'PackerSync'
    " exec 'call NvimSet()'
    " exec 'call CocInstal()'
endfunc

" 代码折叠
function FoldConfig()
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
endfunction
autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()
