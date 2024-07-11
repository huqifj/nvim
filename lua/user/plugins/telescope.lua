return {
	"nvim-telescope/telescope.nvim",
	breach = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			version = "^1.1.0",
		},
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
                dynamic_preview_title = true,
				path_display = { "shorten" },
				mappings = {},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")
	end,

    -- stylua: ignore
    keys = {
		{ "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", desc = "telescope find all files" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "telescope find buffers" },
        { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
        { "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live grep with args" },
	    { "<leader>fh", require("telescope.builtin").help_tags, desc = "Find help tegs" },
		{ "<leader>fi", "<cmd>Telescope git_commits<CR>", desc = "telescope git commits" },
	    { "<leader>fk", require("telescope.builtin").keymaps, desc = "Find keymaps" },
		{ "<leader>fm", "<cmd>Telescope marks<CR>", desc = "telescope find marks" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
		{ "<leader>fu", "<cmd>Telescope git_status<CR>", desc = "telescope git status" },
		{ "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "telescope find in current buffer" },
    },
}
