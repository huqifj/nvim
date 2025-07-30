return {
	"hotoo/pangu.vim",

	config = function()
		vim.keymap.set("n", "<leader>ck", "<cmd>PanguAll<cr>")
	end
}
