if vim.fn.has("win32") == 1 then
	return {
		"keaising/im-select.nvim",
		config = function()
			require("im_select").setup({
				default_im_select = "英语模式",
				default_command = "im-select-mspy.x64.exe",
				set_previous_events = {}
			})
		end,
	}
else
	return {}
end
