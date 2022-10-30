local packer=require("packer")
packer.startup({
    function(use)
        use 'wbthomason/packer.nvim'
        use 'voldikss/vim-translator'
        use 'tpope/vim-surround'
        use {'nvim-treesitter/nvim-treesitter',run=':TSUpdate'}
        use 'lukas-reineke/indent-blankline.nvim'
        use 'glepnir/dashboard-nvim'
        --依赖 apt install ripgrep
        use 'ahmedkhalf/project.nvim'       --开屏
        use
        {
            'nvim-telescope/telescope.nvim',
            tag= '0.1.0',
            require=
            {
                'nvim-lua/plenary.nvim'
            }
        }
        use 'tpope/vim-commentary'     --快速注释
        use 'kien/rainbow_parentheses.vim'    --括号颜色
        use {
            'neoclide/coc.nvim',
            branch = 'master',
            run = 'yarn install --frozen-lockfile'
        }
        use 'wookayin/vim-autoimport'     --导入包
        use 'lfv89/vim-interestingwords'
        use
        {
            'fisadev/vim-isort', ft={'py'}
        }

        use 'folke/tokyonight.nvim'
        use 'xiyaowong/nvim-transparent'
        use 'mfussenegger/nvim-dap'
        use 'ravenxrz/DAPInstall.nvim'
        use 'rcarriga/nvim-dap-ui'         --左边
        use 'theHamsta/nvim-dap-virtual-text'
    end,
config={
    profile={
        enable=true,
        threshold=1
    },
    -- display={
    --     open_fn=require('packer.util').float,
    -- },
    --并发数量限制
    max_jobs=16,
    --自定义源
    git={
        -- default_url_format = "https://hub.fastgit.xyz/%s",
        -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
        -- default_url_format = "https://gitcode.net/mirrors/%s",
        -- default_url_format = "https://gitclone.com/github.com/%s",
        },
    },
})

--自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup END
  ]]
)
