return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		animation = false,
		-- insert_at_start = true,
		-- …etc.
	},
	config = function(_, opts)
		require("barbar").setup(opts)

		local map = vim.api.nvim_set_keymap
		local keymap_opts = { noremap = true, silent = true }

		-- Move to previous/next
		map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", keymap_opts)
		map("n", "<A-.>", "<Cmd>BufferNext<CR>", keymap_opts)

		-- Re-order to previous/next
		map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", keymap_opts)
		map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", keymap_opts)

		-- Close buffer
		map("n", "<A-c>", "<Cmd>BufferClose<CR>", keymap_opts)
		map("n", "<leader>ba", "<Cmd>BufferCloseAllButCurrent<CR>", keymap_opts)

		-- Magic buffer-picking mode
		map("n", "<C-b>", "<Cmd>BufferPick<CR>", keymap_opts)
		map("n", "<C-s-b>", "<Cmd>BufferPickDelete<CR>", keymap_opts)
	end,
}
