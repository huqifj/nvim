return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-dap-python",
		},
		event = "VeryLazy",
		keys = {
			-- add a keymap to browshttps://github.com/cmu-db/bustub.gite plhttps://github.com/cmu-db/bustub.gitugin files
			{
				"<f5>",
				function()
					require("dap").continue()
				end,
				desc = "launch/continue gdb",
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

            require("dap-python").setup("C:/Users/chuan/AppData/Local/nvim/.virtualvenvs/debugpy/Scripts/python")
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
			-- dap.adapters.python = function(cb, config)
			-- 	if config.request == "attach" then
			-- 		---@diagnostic disable-next-line: undefined-field
			-- 		local port = (config.connect or config).port
			-- 		---@diagnostic disable-next-line: undefined-field
			-- 		local host = (config.connect or config).host or "127.0.0.1"
			-- 		cb({
			-- 			type = "server",
			-- 			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			-- 			host = host,
			-- 			options = {
			-- 				source_filetype = "python",
			-- 			},
			-- 		})
			-- 	else
			-- 		cb({
			-- 			type = "executable",
			-- 			command = ".virtualvenvs/debugpy/Scripts/python",
			-- 			args = { "-m", "debugpy.adapter" },
			-- 			options = {
			-- 				source_filetype = "python",
			-- 			},
			-- 		})
			-- 	end
			-- end
			-- dap.configurations.python = {
			-- 	{
			-- 		-- The first three options are required by nvim-dap
			-- 		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
			-- 		request = "launch",
			-- 		name = "Launch file",
			--
			-- 		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
			--
			-- 		program = "${file}", -- This configuration will launch the current file if used.
			-- 		pythonPath = function()
			-- 			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- 			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- 			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			-- 			local cwd = vim.fn.getcwd()
			-- 			if vim.fn.executable(cwd .. ".virtualvenvs/debugpy/Scripts/python") == 1 then
			--                          print(cwd .. ".virtualvenvs/debugpy/Scripts/python")
			-- 				return cwd .. ".virtualvenvs/debugpy/Scripts/python"
			-- 			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
			-- 				return cwd .. "/.venv/bin/python"
			-- 			else
			-- 				return "/usr/bin/python"
			-- 			end
			-- 		end,
			-- 	},
			-- }
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
}
