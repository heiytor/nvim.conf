local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	-- Telescope
	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", bufopts)
	vim.keymap.set("n", "<leader>d", "<cmd>Telescope lsp_document_symbols<cr>", bufopts)

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader><F2>", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	-- Format on save
	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format()
		end,
	})
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_config = {
	capabilities = capabilities,
	group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
	on_attach = function(_, bufnr)
		on_attach(_, bufnr)
	end,
}

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup(lsp_config)
	end,
	lua_ls = function()
		require("lspconfig").lua_ls.setup(vim.tbl_extend("force", lsp_config, {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		}))
	end,
	tsserver = function()
		require("typescript").setup({
			server = vim.tbl_extend("force", lsp_config, {
				on_attach = function(_, bufnr)
					on_attach(_, bufnr)
				end,
				init_options = {
					preferences = {
						importModuleSpecifierPreference = "project=relative",
						jsxAttributeCompletionStyle = "none",
					},
				},
			}),
		})
	end,
})
