exec 'source $HOME/.config/nvim/static.vim'
" 加载插件
exec 'source $HOME/.config/nvim/plugin/coc_nvim.vim'
exec 'source $HOME/.config/nvim/plugin/plugConfig.vim'
lua require("plugins")
lua require("dashboardConfig")
lua require("surface-plugin-config")
lua require("nvim-treesitter-config")
lua require("nvim-tree-config")
" let g:lightline={'colorscheme':''}

" 安装依赖
nnoremap <F3> :call InstallRely()<CR>
func! InstallRely()
    exec '!git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim'
    if has('nvim')
        exec 'call NvimSet()'
    else
        exec 'call VimSet()'
    endif
    exec 'call CocInstal()'
    exec '!apt install astyle -y'
    exec '!pip install autopep8 -y'
    exec '!pip install pynvim -y'
    exec 'call TeleRely()'
endfunc

nnoremap <silent><leader>fc :call FormatCode()<CR>
func! FormatCode()
    exec "w"
    if &filetype=='c'||
                \&filetype=='cpp'||
                \&filetype=='java'
        exec "!astyle --style=allman %"
    elseif &filetype=='python'
        exec ":Isort"
        exec "!autopep8 --in-place --aggressive --aggressive %"
    endif
endfunc

let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
let g:vimspector_base_dir='/root/.vim/plugged/vimspector'
