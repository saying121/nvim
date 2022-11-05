if !isdirectory(stdpath('data') . '/site/pack/packer/start/packer.nvim/')
    execute '!git clone --depth 1 https://github.com/wbthomason/packer.nvim
                \ ~/.local/share/nvim/site/pack/packer/start/packer.nvim'
    autocmd VimEnter * PackerSync --sync
    autocmd source $MYVIMRC
endif
exec 'source $HOME/.config/nvim/static.vim'
" 加载插件
" exec 'source $HOME/.config/nvim/plugin/coc_nvim.vim'
exec 'source $HOME/.config/nvim/plugin/plugConfig.vim'
exec 'source $HOME/.config/nvim/plugin/floaterm-vim.vim'
lua require("plugins")
lua require("lsp")

lua require("surface")

lua require("nvim-treesitter-config")
lua require("nvim-tree-config")
lua require("project-nvim-config")
lua require("dap-nvim-config")
lua require("aerial-config")
lua require("telescope-config")
lua require("image-preview")


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
    " exec 'call CocInstal()'
    exec '!pip install autopep8 -y'
    exec '!pip install pynvim -y'
    exec 'call TeleRely()'
endfunc
