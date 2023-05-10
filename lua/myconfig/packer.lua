-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope. Should be built in it's so useful.
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Theme
    use {
        'rebelot/kanagawa.nvim',
        config = function()
            vim.cmd('colorscheme kanagawa')
        end
    }

    -- Treesitter for proper parsing
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/playground')

    -- For easily reverting changes in a file, even across sessions
    use('mbbill/undotree')

    -- Git integration
    use('tpope/vim-fugitive')

    -- Prettier status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- For quickly commenting/uncommenting blocks of code
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- nvim-neo-tree -- For better manual file exploring
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- NeoVim API helpers for editing config
    -- Must be setup before lspconfig
    use {
        'folke/neodev.nvim',
        config = function()
            require('neodev').setup()
        end
    }

    -- Git diff statuses next to line numbers
    use { 'lewis6991/gitsigns.nvim' }

    -- LSP Configuration & Plugins
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            {
                'williamboman/mason.nvim',
                config = function()
                    require('mason').setup()
                end
            },

            -- Set up in after/plugin/lsp.lua
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            {
                'j-hui/fidget.nvim',
                config = function()
                    require('fidget').setup()
                end
            },
        },
    }

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer', -- Optional
            'hrsh7th/cmp-path',   -- Optional
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
    }
end)
