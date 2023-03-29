-- Plugin manager
require("plugins")

-- Keybindings and environment configuration
require("remap")
require("environment")

-- Color scheme
require("color")

-- LSP and Mason
require("lsp_conf")
require("mason_conf")
require("null-ls_conf")

-- LSP and LSPKind
require("cmp_conf")
require("lspkind_conf")

-- Treesitter
require("treesitter_conf")

-- Telescope
require("telescope_conf")

-- Git
require("vim-fugitive_conf")

-- Text
require("autopairs_conf")

-- Others
require("lualine_conf")
require("web-devicons_conf")
require("toggleterm_conf")
require("comment_conf")
