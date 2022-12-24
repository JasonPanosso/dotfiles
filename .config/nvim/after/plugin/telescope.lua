local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader><C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local imaps = {}
local function fb_action(f)
	return function(b)
		require("telescope").extensions.file_browser.actions[f](b)
	end
end

require("telescope").setup({
	defaults = { mappings = { i = imaps } },
	extensions = {
		file_browser = {
			mappings = {
				i = vim.tbl_extend("force", imaps, {
					["<C-j>"] = fb_action("create_file"),
					["<C-v>"] = fb_action("toggle_browser"),
				}),
			},
		},
	},
})

require("telescope").load_extension("file_browser")
