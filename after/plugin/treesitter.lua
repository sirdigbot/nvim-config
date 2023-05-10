require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
        'c',
        'cpp',
        'go',
        'help',
        'javascript',
        'lua',
        'rust',
        'typescript',
        'query',
        'vim',
        'vimdoc',
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>', -- C-Space conflicts with nvim-cmp and I'm not sure how to fix it
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.sourcepawn = {
    install_info = {
        url = "https://github.com/sirdigbot/tree-sitter-sourcepawn", -- local path or git repo
        files = { "src/parser.c", "src/scanner.c" },                 -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "nvim-support",                                     -- default branch in case of git repo if different from master
        generate_requires_npm = false,                               -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false,                      -- if folder contains pre-generated src/parser.c
    },
    filetype = "sp",                                                 -- if filetype does not match the parser name
}
