call plug#begin ('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'      "缩进线
Plug 'glepnir/dashboard-nvim'       "开屏
"依赖 apt install ripgrep
Plug 'ahmedkhalf/project.nvim'       "开屏
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" or                                , { 'branch': '0.1.x' }

Plug 'tpope/vim-commentary'     "快速注释
Plug 'kien/rainbow_parentheses.vim'    "括号颜色
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'wookayin/vim-autoimport'     "导入包
Plug 'lfv89/vim-interestingwords'
Plug 'vim-autoformat/vim-autoformat'
Plug 'fisadev/vim-isort'        "格式化python 也可以pip install isort
Plug 'mfussenegger/nvim-dap'
Plug 'ravenxrz/DAPInstall.nvim'
Plug 'rcarriga/nvim-dap-ui'         "左边
Plug 'theHamsta/nvim-dap-virtual-text'

Plug 'puremourning/vimspector'

call plug#end()
