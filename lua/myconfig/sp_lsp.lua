local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

-- Check if the config is already defined (useful when reloading this file)
if not configs.sp_lsp then
    configs.sp_lsp = {
        default_config = {
            cmd = {'sourcepawn_lsp'},
            filetypes = {'sp', 'sourcepawn'},
            root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname)
            end,
            single_file_support = true,
            settings = {
                ['SourcePawnLanguageServer'] = {
                    spcompPath = '',
                    includesDirectories = {},
                    linterArguments = {},
                    mainPath = '',
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
        },
    },
}

