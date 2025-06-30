return {
	-- Neovim plugin for a code outline window
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	opts = {
		-- optionally use on_attach to set keymaps when aerial has attached to a buffer
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
	},

	-- vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
	keys = {
		{
			"<leader>a",
			"<cmd>AerialToggle!<CR>",
			{ desc = "Toggle Aerial" },
		},
	},
}
