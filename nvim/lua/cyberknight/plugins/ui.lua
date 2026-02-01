return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    { "nvim-mini/mini.icons", version = "*", opts = {} },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local lazy_status = require("lazy.status")
            local mode = {
                'mode',
                fmt = function(str)
                    -- return ' ' 
                    -- displays only the first character of the mode
                    return ' ' .. str
                end,
            }
            local diff = {
                'diff',
                colored = true,
                symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
                -- cond = hide_in_width,
            }

            local filename = {
                'filename',
                file_status = true,
                path = 0,
            }

            local branch = {'branch', icon = {'', color={fg='#A6D4DE'}}, '|'}

            require("lualine").setup({
                options = {
                    theme = "catppuccin-mocha",
                },
                sections = {
                    lualine_a = { mode },
                    lualine_b = { branch },
                    lualine_c = { diff, filename },
                    lualine_x = {
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                            color = { fg = "#ff9e64" },
                        },
                        -- { "encoding",},
                        -- { "fileformat" },
                        { "filetype" },
                    },
                },

            })
        end,
    },
    {
        "b0o/incline.nvim",
        enabled = true,
        dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
        config = function()
            local helpers = require 'incline.helpers'
            local navic = require 'nvim-navic'
            local devicons = require 'nvim-web-devicons'
            require('incline').setup {
                window = {
                    padding = 0,
                    margin = { horizontal = 0, vertical = 0 },
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                    if filename == '' then
                        filename = '[No Name]'
                    end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)
                    local modified = vim.bo[props.buf].modified
                    local res = {
                        ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
                        ' ',
                        { filename, gui = modified and 'bold,italic' or 'bold' },
                        guibg = '#44406e',
                    }
                    if props.focused then
                        for _, item in ipairs(navic.get_data(props.buf) or {}) do
                            table.insert(res, {
                                { ' > ', group = 'NavicSeparator' },
                                { item.icon, group = 'NavicIcons' .. item.type },
                                { item.name, group = 'NavicText' },
                            })
                        end
                    end
                    table.insert(res, ' ')
                    return res
                end,
            }
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            preset = "helix",
            plugins = {
                registers = true,
            }
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            options = {
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " "
                        or (e == "warning" and " " or " ")
                        s = s .. n .. sym
                    end
                    return s
                end,
                separator = "slanted",
                show_close_icons = true,
                show_buffer_close_icons = true
            }
        }
    },
    {
        "catgoose/nvim-colorizer.lua",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            local colorizer = require("colorizer")

            colorizer.setup({
                user_default_options = {
                    tailwind = true,
                },
                filetpyes = { "html", "css", "javascript", "typescript", "jsx", "tsx" },

                vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
                    callback = function()
                        vim.cmd("ColorizerAttachToBuffer")
                    end,
                })
            })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            require("ibl").setup { indent = { highlight = highlight } }
        end,
    }
}
