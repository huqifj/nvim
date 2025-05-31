return {
	"stevearc/conform.nvim",
	dependencies = { "williamboman/mason.nvim" },
	lazy = true,
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	},

	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
			{ desc = "Format file or range (in visual mode)" },
		},
	},
}
