autocmd VimEnter * :call InitFunc()

function! InitFunc()
    if !isdirectory(stdpath('data') . '/site/pack/packer/start/packer.nvim/')
        exec ':call ClonePacker()'
        exec ':call InstallRely()'
        source $MYVIMRC
    endif
endfunction

" 安装packer
func! ClonePacker()
    execute '!git clone --depth 1 https://github.com/wbthomason/packer.nvim
                \ ~/.local/share/nvim/site/pack/packer/start/packer.nvim'
    source $MYVIMRC
    execute ':PackerSync'
    source $MYVIMRC
endfunc

func! NvimSet()
    if has('unix')
        if !isdirectory(stdpath('data') . '/site/pack/packer/start/packer.nvim/')
            exec ':call ClonePacker()'
            exec ':call InstallRely()'
            source $MYVIMRC
        endif
    elseif has('mac')
        if !isdirectory(stdpath('data') . '/site/pack/packer/start/packer.nvim/')
            exec ':call ClonePacker()'
            exec ':call InstallRely()'
            source $MYVIMRC
        endif
    endif
endfunc
" ***********************************************************
" 基础配置
source $HOME/.config/nvim/viml/init.vim
" 加载插件
source ~/.config/nvim/plugin/init.vim

lua require("init")
" ***********************************************************

" 安装依赖
nnoremap <F2> :call InstallRely()<CR>
func! InstallRely()
    exec '!pip install black isort pynvim '
    exec 'PackerSync'
    exec 'term sudo apt install -y
                \ ripgrep
                \ nodejs
                \ npm'
    exec '!sudo npm install -g pyright'
    " exec 'call NvimSet()'
    " exec 'call CocInstal()'
endfunc

" 代码折叠
function FoldConfig()
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
endfunction
autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()
