local function switch_source_header(bufnr)
	local method_name = "textDocument/switchSourceHeader"
	local client = vim.lsp.get_clients({ bufnr = bufnr, name = "clangd" })[1]
	if not client then
		return vim.notify(
			("method %s is not supported by any servers active on the current buffer"):format(method_name)
		)
	end
	local params = vim.lsp.util.make_text_document_params(bufnr)
	client.request(method_name, params, function(err, result)
		if err then
			error(tostring(err))
		end
		if not result then
			vim.notify("corresponding file cannot be determined")
			return
		end
		vim.cmd.edit(vim.uri_to_fname(result))
	end, bufnr)
end

return {
	cmd = { "clangd" },
	filetypes = { "cpp", "c" },
	root_markers = { -- The “root markers” used to determine the root directory of the workspace
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac", -- AutoTools
		".git",
	},
	on_attach = function(_, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "LspClangdSwitchSourceHeader", function()
			switch_source_header(bufnr)
		end, { desc = "Switch between source/header" })

		-- vim.api.nvim_buf_create_user_command(bufnr, "LspClangdShowSymbolInfo", function()
		-- 	symbol_info()
		-- end, { desc = "Show symbol info" })
	end,
}
