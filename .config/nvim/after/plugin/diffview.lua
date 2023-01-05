local actions = require("diffview.actions")

require("diffview").setup({
	diff_binaries = false, -- Show diffs for binaries
	use_icons = true, -- Requires nvim-web-devicons
	keymaps = {
		view = {
			{ "n", "<leader>k", actions.toggle_files, { desc = "Toggle the file panel." } },
		},
		file_panel = {
			{ "n", "<leader>k", actions.toggle_files, { desc = "Toggle the file panel." } },
		},
		file_history_panel = {
			{ "n", "<leader>k", actions.toggle_files, { desc = "Toggle the file panel." } },
		},
	},
})
