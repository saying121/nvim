-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    trash = {
        cmd = "trash-put",
        require_confirm = true,
    },
})

-- nnoremap <leader>e :NvimTreeToggle<CR>
vim.api.nvim_set_keymap(
    "n",
    "<leader>e",
    "<cmd>NvimTreeToggle<CR>",
    { silent = true, noremap = true }
)
