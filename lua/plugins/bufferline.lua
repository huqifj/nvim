return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({})
		vim.keymap.set("n", "<leader>[b", "<cmd>BufferLineMovePrev<CR>")
		vim.keymap.set("n", "<leader>]b", "<cmd>BufferLineMoveNext<CR>")
	end,
}
