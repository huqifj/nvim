return {
	"mbbill/undotree",

	-- 在 Windows 需要安装 diff：scoop install diffutils

	keys = {
		{ "<leader>u", "<cmd>:UndotreeToggle<cr>", desc = "Toggle undo tree" },
	}
}
