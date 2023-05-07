-- On windows:
-- Packer wont work without administrator command prompt
-- LSP cannot compile modules without Visual Studio Developer command prompt.

-- Both will *run* in regular command prompt fine, though.
-- Just switch when you need to do :PackerSync or install an LSP for a lang.

require("myconfig.packer")
require("myconfig.set") -- Before remap since it sets <leader>
require("myconfig.remap")

require("myconfig.sp_lsp")


-- Set up plugins
require("github-theme").setup()
require("Comment").setup()
