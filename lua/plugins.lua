local packer=require("packer")
packer.startup({
    function(use)
        use 'steelsojka/pears.nvim'
        use {
            'stevearc/aerial.nvim',
            config = function() require('aerial').setup() end
        }
        use {
            "LintaoAmons/scratch.nvim",
            tag = "v0.2.0" -- use tag for stability, or without this to have latest fixed and functions
        }
        use 'adelarsq/image_preview.nvim'
        use 'mfussenegger/nvim-dap'
        use 'ravenxrz/DAPInstall.nvim'
        use 'rcarriga/nvim-dap-ui'         --左边
        use 'theHamsta/nvim-dap-virtual-text'
        use 'voldikss/vim-floaterm'
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
        use 'nvim-telescope/telescope-media-files.nvim'
        use 'nvim-telescope/telescope-file-browser.nvim'
        use 'ahmedkhalf/project.nvim'
        use {
            'nvim-telescope/telescope.nvim', tag= '0.1.0',
            --依赖 apt install ripgrep
        }
        use 'neovim/nvim-lspconfig'
        use 'williamboman/nvim-lsp-installer'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'

        use 'f3fora/cmp-spell'
        use 'L3MON4D3/LuaSnip'
        use 'rafamadriz/friendly-snippets'
        -- use 'hrsh7th/cmp-vsnip'
        -- use 'hrsh7th/vim-vsnip'
        -- use {
        --     'neoclide/coc.nvim',
        --     branch = 'release'
        -- }
        use 'wookayin/vim-autoimport'     --导入包
        use 'lfv89/vim-interestingwords'
        use {
            'stsewd/isort.nvim',
            run=':UpdateRemotePlugins',
        }
        -- use {
        --     'fisadev/vim-isort',
        --     ft={'python'}
        -- }
        use 'p00f/nvim-ts-rainbow'
        use {
            'nvim-treesitter/nvim-treesitter',
            run=':TSUpdate'
        }
        -- use 'itchyny/vim-cursorword'
        use 'glepnir/dashboard-nvim'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use {
            'EdenEast/nightfox.nvim',
            run=':NightfoxCompile',
        }
        use 'folke/tokyonight.nvim'
        use 'xiyaowong/nvim-transparent'
        use 'numToStr/Comment.nvim'
        use 'tpope/vim-surround'
        use 'lukas-reineke/indent-blankline.nvim'
        use 'voldikss/vim-translator'
        use 'wbthomason/packer.nvim'
    end,
    config={
        profile={
            enable=true,
            threshold=1
        },
        display={
            open_fn=require('packer.util').float,
        },
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
