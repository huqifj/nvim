return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			color_overrides = {
				mocha = {
					-- base = "#000000",
					-- mantle = "#000000",
					-- crust = "#000000",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
