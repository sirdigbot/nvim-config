-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)


-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins folder
        --{ import = "myconfig.plugins" },


        ---- Theme ----
        {
            'rebelot/kanagawa.nvim',
            config = function()
                vim.cmd('colorscheme kanagawa')
            end
        },
        
        -- Rainbow effect for nested delimeters/brackets/parentheses
        -- NOTE: Setup done in after/treesitter.lua settings.
        { 'HiPhish/nvim-ts-rainbow2' },


        ---- Essential ----
        {
            'nvim-telescope/telescope.nvim', branch = '0.1.x', -- or tag '0.1.8'
            dependencies = { 'nvim-lua/plenary.nvim' }
        },

        -- Treesitter for proper parsing
        { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
        { 'nvim-treesitter/nvim-treesitter-context' },
        { 'nvim-treesitter/playground' },

        {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        },

        -- For easily reverting changes in a file, even across sessions
        { 'mbbill/undotree' },

        -- Auto-detect shiftwidth and expandtab based on current file
        { 'tpope/vim-sleuth' },

        -- Git integration
        { 'tpope/vim-fugitive' },
        
        -- NeoVim API helpers for editing config
        -- Must be setup before lspconfig
        {
            'folke/neodev.nvim',
            config = function()
                require('neodev').setup()
            end
        },
        
        
        ---- LSP Configuration & Plugins ----
        {
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
        },
        
        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer', -- Optional
                'hrsh7th/cmp-path',   -- Optional
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',
            },
        },



        ---- Other ----

        -- For quickly commenting/uncommenting blocks of code
        {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        },

        -- nvim-neo-tree -- For better manual file exploring
        {
            'nvim-neo-tree/neo-tree.nvim',
            branch = 'v3.x',
            dependencies = {
              'nvim-lua/plenary.nvim',
              'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
              'MunifTanjim/nui.nvim',
              -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            }
        },
        
        -- Git diff statuses next to line numbers
        { 'lewis6991/gitsigns.nvim' },
        
        -- Quickly split/join blocks of code like arrays, dictionaries, statements, etc.
        {
            'Wansmer/treesj',
            requires = { 'nvim-treesitter' },
        },
        
        { 'chentoast/marks.nvim' },
    },
  
  
    -- automatically check for plugin updates
    checker = { enabled = true },
})
