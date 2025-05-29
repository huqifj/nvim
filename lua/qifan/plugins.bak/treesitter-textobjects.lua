return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	event = {
		"User FileOpened",
	},
	after = "nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {},
}
