-- On windows:
-- Packer wont work without administrator command prompt
-- LSP cannot compile modules without Visual Studio Developer command prompt.

-- Both will *run* in regular command prompt fine, though.
-- Just switch when you need to do :PackerSync or install an LSP for a lang.


require("myconfig.options") -- Before remap since it sets <leader>.
                            -- Before lazy because lazy said to set <leader> first.
require("myconfig.lazy")    -- Before remap so we can remap plugins
require("myconfig.remap")


require("myconfig.ui")


