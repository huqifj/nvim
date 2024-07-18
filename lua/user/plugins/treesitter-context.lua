return {
	"nvim-treesitter/nvim-treesitter-context",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	after = "nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("treesitter-context").setup({})

		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true })
	end,
}
