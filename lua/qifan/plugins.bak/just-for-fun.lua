return {
	"eandrju/cellular-automaton.nvim",
	event = "VeryLazy",

	config = function()
		-- require("cellular-automaton").setup({})
		vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
	end,
}
