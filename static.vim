func! NvimSet()
    if(has("win32") || has("win64") || has("win95") || has("win16"))
        if empty(glob('$HOME\\AppData\\Local\\nvim'))
            silent !git clone https://github.com/wbthomason/packer.nvim
                        \"$env:LOCALAPPDATA\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
            autocmd source $MYVIMRC
            autocmd VimEnter * PackerSync
        else
            exec 'PackerSync'
        endif
    elseif has('unix')
        if !isdirectory(stdpath('data') . '/site/pack/packer/start/packer.nvim/')
            silent !git clone --depth 1 https://github.com/wbthomason/packer.nvim
                        \~/.local/share/nvim/site/pack/packer/start/packer.nvim
            autocmd source $MYVIMRC
            autocmd VimEnter * PackerSync
        else
            exec 'PackerSync'
        endif
    elseif has('mac')
        if empty(glob('~/.local/share/nvim/site/pack/packer/start/packer.nvim'))
            silent !git clone --depth 1 https://github.com/wbthomason/packer.nvim
                            \~/.local/share/nvim/site/pack/packer/start/packer.nvim
            autocmd source $MYVIMRC
            autocmd VimEnter * PackerSync
        else
            exec 'PackerSync'
        endif
    endif
endfunc

" 基本设置
" 出现CONVERSION ERROR就输入指令:w ++enc=utf-8 强制转码
let mapleader=";"
set ttimeout ttimeoutlen=10    "设置切换模式的延迟时间
set undofile
set history=100
set mouse=a            "鼠标可用

" 恢复光标位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" 显示设置
set termguicolors
set listchars=eol:
set number            "显示行号
set relativenumber
syntax on            "当前缓冲区中高亮
syntax enable        "语法高亮
set hlsearch        "搜索结果高亮
set incsearch        "搜索输入时动态高亮
set showmatch        "高亮显示匹配括号

" 当前行高亮
set cursorline
autocmd WinEnter,InsertLeave * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" 写入自动删除行末空格
augroup blank
    autocmd!
    autocmd BufWrite * :%s/\s\+$//e
    " autocmd BufWrite *.vim  :%s/\s\+$//e
augroup END

" 自动创建代码块
" augroup views
    " autocmd!
    " autocmd BufWrite * mkview
    " autocmd BufWinLeave * mkview
    " autocmd BufRead * silent loadview
" augroup END

highlight Folded ctermbg=0    "折叠颜色设置ctermfg=169
highlight foldcolumn ctermbg=0
set foldcolumn=2                        "显示折叠提示

" 缩进
set autoindent        "和前一行缩进相同
set smartindent        "和前一行有相同缩进量。识别}(不缩进)，识别c语言。#开头行不缩进。
set cindent            "用c语言缩进格式
" 统一tab为4
set shiftwidth=4    ">>命令缩进的空格数
set tabstop=4        "TAB键宽度
set smarttab        "根据文件中其他地方的缩进空格个数来确定一个 tab 是多少个空格
set expandtab        "把TAB换成空格
set softtabstop=4    "将连续数量的空格视作一个tab,可以一次删除
"set noexpandtab        "不要用空格符代表制表符

" 临时文件
set backup        "备份文件
set swapfile        "创建临时交换文件
set updatecount=400 "交换文件刷新方式,400字/updatetime=time
set writebackup    "编辑时备份文件
set undofile        "撤销文件
set undodir=~/.config/nvim/undodir  "指定撤销文件目录

" F4一键执行代码
nnoremap <F4> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype=='c'
        if !isdirectory('cbuild')
            execute "! mkdir cbuild"
        endif
        exec "! gcc % -o cbuild/%<"
        exec "term time ./cbuild/%<"
    elseif &filetype=='cpp'
        if !isdirectory('c++build')
            execute "! mkdir c++build"
        endif
        exec "! g++ % -o c++build/%<"
        exec "term time ./build/%<"
    elseif &filetype=='java'
        if !isdirectory('javabuild')
            execute "! mkdir javabuild"
        endif
        exec "! javac -d ./javabuild/ %"
        exec "term time java -cp ./javabuild/ %<"
    elseif &filetype=='sh'
        :term time bash %
    elseif &filetype=='python'
        exec "term time python3 %"
    elseif &filetype=='lua'
        exec "term time lua %"
    elseif &filetype=='go'
        exec "! go build %<"
        exec "term time go run %"
    endif
endfunc

" 编码设置
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936    "检测文件编码，将fileencoding设置为最终编码
set fileencoding=utf-8                                "保存时的文件编码
set termencoding=utf-8                                "终端输出的字符编码
set encoding=utf-8                                    "VIM打开文件用的内部编码
scriptencoding utf-8
set fileformat=unix      " 设定文件格式为unix
set fileformats=unix,dos,mac        " 识别文件格式

" 状态栏
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
" set statusline=%<%F%=%y%m%r%h%w%{&ff}\[%{&fenc}]0x%02B@%040h#%n\(%3l/%3L,%3c\|%3v\)%3p%%
set laststatus=2                            "显示状态栏信息
set statusline=%6*\%{StatuslineGit()}\
set statusline+=%1*\%<%.50F\                    "显示文件名和文件路径 (%<应该可以去掉)
" set statusline+=%7*\%{StatusDiagnostic()}\
set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
set statusline+=%4*\ row:%l/%L,col:%c\ %*   "显示光标所在行和列
set statusline+=%5*\%3p%%\%*                "显示光标前文本所占总文本的比例
" hi User6 cterm=none ctermfg=35 "ctermbg=0
hi User6 guifg=Olivedrab
" hi User1 cterm=none ctermfg=25 "ctermbg=0
hi User1 guifg=blue
" hi User7 cterm=none ctermfg=45 "ctermbg=0
" hi User7 guifg=red
" hi User2 cterm=none ctermfg=208 "ctermbg=0
hi User2 guifg=Turquoise
" hi User3 cterm=none ctermfg=169 "ctermbg=0
hi User3 guifg=Darkgray
" hi User4 cterm=none ctermfg=100 "ctermbg=0
hi User4 guifg=Cyan
" hi User5 cterm=none ctermfg=green "ctermbg=0
hi User5 guifg=green
" %number *\ ... \%*和对应，后面设置的颜色样式会应用到中的部分hi User<number>hi User<number>%number *\ ... \%*...
" %< 如果状态行过长，在何处换行
" %F 完整文件路径名
" %.50F 文件路径名长度不超过50，超过则进行缩写
" %= 在此之后的内容，显示在状态栏上时右对齐
" %y 文件类型
" %m 如果缓冲区已修改则表示为[+]
" %r 如果缓冲区为只读则表示为[RO]
" %h 如果为帮助显示为缓冲区[Help]
" %w 如果为预览窗口则显示为[Preview]
" %{&ff} 显示文件系统类型
" %{&fenc} 显示文件编码
" %l 光标所在行数
" %L 文件总行数
" %c 光标所在列数
" %p 当前行数占总行数的的百分比
" cterm：设置粗体，斜体，正体;ctermfg：前景色;ctermbg：背景色

" 映射按键
nnoremap <leader>w :w<CR>
nnoremap j gj
nnoremap k gk
set wrap

" copy paste system clipboard
" ^= 把值加到默认值前
" set clipboard^=unnamedplus
set clipboard^=unnamed
nnoremap Y  y$

" 创建tab
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>

" 切换buffer
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
nnoremap ]B :blast<CR>
nnoremap [B :bfirst<CR>

" 切换窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <Esc> <C-\><C-n>

" 调整窗口大小
nnoremap <M-,> <C-W><
nnoremap <M-.> <C-W>>
nnoremap <M--> <C-W>-
nnoremap <M-=> <C-W>+

" Alt+t开启关闭终端,vim和nvim不太一样
nnoremap <M-t> :ter<CR>A
tnoremap <M-t> exit<CR>

nnoremap <silent><BackSpace> :noh<CR>
nnoremap <space>s :source $MYVIMRC<CR>

function! CheckChineseMark()
    "依次检查
    if search('。')
        let s:line=search('。')
        execute s:line . "s/。/\./g"
    endif

    if search('，')
        let s:line=search('，')
        execute s:line . "s/，/,/g"
    endif

    if search('；')
        let s:line=search('；')
        execute s:line . "s/；/,/g"

    endif

    if  search('？')
        let s:line=search('？')
        execute s:line . "s/？/?/g"
    endif

    if search('：')
        let s:line=search('：')
        execute s:line . "s/：/\:/g"
    endif

    if search('‘')
        let s:line=search('‘')
        execute s:line . "s/‘/\'/g"
    endif

    if search('’')
        let s:line=search('’')
        execute s:line . "s/’/\'/g"
    endif

    if search('”')
        let s:line=search('”')
        execute s:line . "s/”/\"/g"
    endif

    if search('“')
        let s:line=search('“')
        execute s:line . "s/“/\"/g"
    endif

    if search('《')
        let s:line=search('《')
        execute s:line . "s/《/\</g"
    endif

    if search('》')
        let s:linie=search('》')
        execute s:line . "s/》/\>/g"
    endif

    if search('——')
        let s:line=search('——')
        execute s:line . "s/——/-/g"
    endif

    if search('）')
        let s:line=search('）')
        execute s:line . "s/）/\)/g"
    endif

    if search('（')
        let s:line=search('（')
        execute s:line . "s/（/\(/g"
    endif

    if search('……')
        let s:line=search('……')
        execute s:line . "s/……/^/g"
    endif

    if search('￥')
        let s:line=search('￥')
        execute s:line . "s/￥/$/g"
    endif

    if search('！')
        let s:line=search('！')
        execute s:line . "s/！/!/g"
    endif

    if  search('·')
        let s:line=search('·')
        execute s:line . "s/·/`/g"
    endif

endfunction

" unmap <C-S>
nnoremap <silent><leader>s :call CheckChineseMark()<CR>:w<CR>
vnoremap <silent><leader>s :call CheckChineseMark()<CR>:w<CR>
