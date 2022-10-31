require'nvim-treesitter.configs'.setup {
    ensure_installed={ "c","python","java","lua","bash","html","javascript","json","sql","vim"},
    sync_install=true,
    auto_install=true,
    incremental_selection={
        enable=true,
        keymaps={
            init_selection="<CR>",
            node_incremental="<CR>",
            scope_incremental="<BS>",
            node_decremental="<leader>rm"
        }
    },
    indent={
        enable=true
    },
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
