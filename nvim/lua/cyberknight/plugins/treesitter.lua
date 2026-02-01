return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPre", "BufNewFile" },
        branch = 'master',
        build = ':TSUpdate',
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            treesitter.setup({
                highlight = { enable = true },
                indent = { enable = true },

                ensure_installed = {
                    "json",
                    "java",
                    "c",
                    "cpp",
                    "bash",
                    "lua",
                    "python",
                    "http",
                    "html",
                    "css",
                    "vim",
                    "dockerfile",
                    "gitignore",
                    "rust",
                    "go",
                    "markdown",
                    "javascript",
                    "typescript",
                    "yaml",
                    "toml",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                    }
                },
                additional_vim_regex_highlighting = false,
            })
        end,
    }
}
