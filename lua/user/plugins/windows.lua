return {
	"anuvyklack/windows.nvim",
	dependencies = {
		"anuvyklack/middleclass",
	},

	config = function()
		require("windows").setup({
			animation = {
				enable = false,
			},
		})

		local function cmd(command)
			return table.concat({ "<Cmd>", command, "<CR>" })
		end

		vim.keymap.set("n", "<C-w>z", cmd("WindowsMaximize"))
		vim.keymap.set("n", "<C-w>_", cmd("WindowsMaximizeVertically"))
		vim.keymap.set("n", "<C-w>|", cmd("WindowsMaximizeHorizontally"))
		vim.keymap.set("n", "<C-w>=", cmd("WindowsEqualize"))
	end,
}
