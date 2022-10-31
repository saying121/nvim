local packer=require("packer")
packer.startup({
    function(use)
        use {
            "LintaoAmons/scratch.nvim",
            tag = "v0.2.0" -- use tag for stability, or without this to have latest fixed and functions
        }
        use 'mfussenegger/nvim-dap'
        use 'ravenxrz/DAPInstall.nvim'
        use 'rcarriga/nvim-dap-ui'         --左边
        use 'theHamsta/nvim-dap-virtual-text'
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
        --依赖 apt install ripgrep
        use 'ahmedkhalf/project.nvim'
        use {
            'nvim-telescope/telescope.nvim', tag= '0.1.0',
        }
        use 'nvim-lua/plenary.nvim'
        use {
            'neoclide/coc.nvim',
            branch = 'master',
            run = 'yarn install --frozen-lockfile'
        }
        use 'wookayin/vim-autoimport'     --导入包
        use 'lfv89/vim-interestingwords'
        use {
            'fisadev/vim-isort', ft={'py'}
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run=':TSUpdate'
        }
        use 'itchyny/vim-cursorword'
        use 'lukas-reineke/indent-blankline.nvim'
        use 'glepnir/dashboard-nvim'
        use 'voldikss/vim-translator'
        use {
            "EdenEast/nightfox.nvim",
            run=":NightfoxCompile",
        }
        use 'folke/tokyonight.nvim'
        use 'xiyaowong/nvim-transparent'
        use 'tpope/vim-commentary'     --快速注释
        use 'tpope/vim-surround'
        use 'wbthomason/packer.nvim'
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
