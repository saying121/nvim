exec 'source $HOME/.config/nvim/static.vim'
" 加载插件
if has('vim')
    exec "source $HOME/.config/nvim/plugConfig/vimplug.vim"
else
    lua require("plugins")
endif
exec 'source $HOME/.config/nvim/plugin/coc_nvim.vim'
exec 'source $HOME/.config/nvim/plugin/plugConfig.vim'
lua require("dashboardConfig")
lua require("plugin-config")
" 透明背景
let g:transparent_enabled=v:true
let g:lightline={'colorscheme':''}

" 安装依赖
nnoremap <F3> :call InstallRely()<CR>
func! InstallRely()
    if has('nvim')
        exec 'call NvimSet()'
    else
        exec 'call VimSet()'
    endif
    exec 'call CocInstal()'
    " exec '!git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim'
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
