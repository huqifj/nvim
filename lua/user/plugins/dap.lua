return {
	{
		"mfussenegger/nvim-dap",
		-- event = "VeryLazy",
		keys = {
			{
				"<f5>",
				function()
					require("dap").continue()
				end,
				desc = "launch/continue gdb",
				-- :lua require'dap'.toggle_breakpoint()
			},
			{
				"<f10>",
				function()
					require("dap").step_over()
				end,
				desc = "Step over",
			},
			{
				"<C-f10>",
				function()
					require("dap").step_into()
				end,
				desc = "Steop into",
			},
			{
				"<C-f>",
				function()
					require("dap").step_out()
				end,
				desc = "Step out",
			},
			{
				"<C-f5>",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate DAP",
			},
		},
		config = function()
			local dap = require("dap")

			-- If using the above, then `/path/to/venv/bin/python -m debugpy --version`
			-- must work in the shell

			dap.adapters.gdb = {
				type = "executable",
				executable = {
					command = vim.fn.exepath("gdb"),
					args = { "-i", "dap" },
				},
			}
			dap.configurations.c = {
				name = "Launch file",
				type = "gdb",
				request = "launch",
				gdbpath = function()
					-- return "/usr/local/bin/gdb"
					return "C:/Users/Qifan.Hu/scoop/apps/gdb/14.1/bin"
				end,
				cwd = "${workspaceFolder}",
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		opts = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			return {
				enabled = true, -- enable this plugin (the default)
				enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
				highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
				highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
				show_stop_reason = true, -- show stop reason when stopped for exceptions
				commented = false, -- prefix virtual text with comment string
				only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
				all_references = false, -- show virtual text on all all references of the variable (not only definitions)
				filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
				-- Experimental Features:
				virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
				all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
				virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
				virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
			}
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {},
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("dap-python").setup("~/venv/bin/python")
			-- require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
		end,
	},
}
