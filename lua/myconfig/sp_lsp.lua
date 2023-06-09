local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

-- Check if the config is already defined (useful when reloading this file)
if not configs.sp_lsp then
    configs.sp_lsp = {
        default_config = {
            cmd = {'sourcepawn_lsp'},
            filetypes = {'sp', 'sourcepawn'},
            root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname) -- Hacky. Needs a better fallback.
            end,
            single_file_support = true,
            settings = {
                ['SourcePawnLanguageServer'] = {
                    spcompPath = '',
                    includesDirectories = {},
                    linterArguments = {},
                    mainPath = '',
                    disableSyntaxLinter = true, -- The vscode extension default as of 5.3.10
                },
            },
        },
    }
end

lspconfig.sp_lsp.setup{
    settings = {
        ['SourcePawnLanguageServer'] = {
            spcompPath = "E:/Dev/vscode-sourcepawn/scripting/spcomp.exe",
            includesDirectories = {
                'E:/Dev/vscode-sourcepawn/scripting/include',
            },
            disableSyntaxLinter = false,
        },
    },
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.sourcepawn = {
    install_info = {
        url = 'https://github.com/sarrus1/tree-sitter-sourcepawn', -- local path or git repo
        files = { 'src/parser.c', 'src/scanner.c' },                 -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = 'main',                                     -- default branch in case of git repo if different from master
        generate_requires_npm = false,                               -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false,                      -- if folder contains pre-generated src/parser.c
    },
    filetype = 'sp',                                                 -- if filetype does not match the parser name
}

