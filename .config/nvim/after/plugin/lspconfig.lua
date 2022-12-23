local status, nvim_lsp = pcall(require, "lspconfig")

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- set up completion capabilities using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- C and Variants
nvim_lsp.clangd.setup({
	capabilities = capabilities,
	lsp_flags = lsp_flags,
})
-- TYPESCRIPT
nvim_lsp.tsserver.setup({
	flags = lsp_flags,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
})

--SVELTE
require("lspconfig").svelte.setup({
	flags = lsp_flags,
})
vim.g.vim_svelte_plugin_use_typescript = 1

-- LUA
-- local stylua = require("stylua-nvim")
require("lspconfig").sumneko_lua.setup({
	commands = {
		Format = {
			function()
				vim.lsp.buf.format()
			end,
		},
	},
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
	capabilities = capabilities,
})

vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 300)

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

