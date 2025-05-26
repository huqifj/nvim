return {
	{
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
		cmd = "Glow",
	},

	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,

		config = function()
			local keymap = vim.keymap

			keymap.set("n", "<leader>mko", "<cmd>MarkdownPreview<CR>", { desc = "MarkdownPreview" })
			keymap.set("n", "<leader>mkc", "<cmd>MarkdownPreviewStop<CR>", { desc = "MarkdownPreviewStop" })
			keymap.set("n", "<leader>mkt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "MarkdownPreviewToggle" })
		end,
	},

	-- -- install with yarn or npm
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	build = "cd app && yarn install",
	-- 	init = function()
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- 	end,
	-- 	ft = { "markdown" },
	-- },
}
