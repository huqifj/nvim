return {
	{
		"gbprod/substitute.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local substitute = require("substitute")

			substitute.setup()

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "<leader>re", substitute.operator, { desc = "Substitute with motion" })
		end,
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({
				wrap = false,
				keymaps = {
					replace = { n = "<localleader>r" },
					qflist = { n = "<localleader>q" },
					syncLocations = { n = "<localleader>s" },
					syncLine = { n = "<localleader>l" },
					close = { n = "<localleader>c" },
					historyOpen = { n = "<localleader>t" },
					historyAdd = { n = "<localleader>a" },
					refresh = { n = "<localleader>f" },
					openLocation = { n = "<localleader>o" },
					gotoLocation = { n = "<enter>" },
					pickHistoryEntry = { n = "<enter>" },
					abort = { n = "<localleader>b" },
					help = { n = "g?" },
					toggleShowRgCommand = { n = "<localleader>p" },
				},
			})
		end,


		vim.keymap.set("n", "<leader>S", '<cmd>GrugFar<CR>', {
			desc = "GrugFar",
		}),
	},
}
