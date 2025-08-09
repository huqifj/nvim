return {
	{
		"mfussenegger/nvim-dap",
		evnet = "VeryLazy",
		config = function()
			local dap = require("dap")
			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			}

			dap.configurations.c = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				},
				{
					name = "Select and attach to process",
					type = "gdb",
					request = "attach",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					pid = function()
						local name = vim.fn.input("Executable name (filter): ")
						return require("dap.utils").pick_process({ filter = name })
					end,
					cwd = "${workspaceFolder}",
				},
				{
					name = "Attach to gdbserver :1234",
					type = "gdb",
					request = "attach",
					target = "localhost:1234",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
				},
			}
		end,
	},
	{
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text", "nvim-neotest/nvim-nio" },
			config = function()
				require("nvim-dap-virtual-text").setup()

				-- use nvim-dap events to open and close the windows automatically
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

				-- customize UI layout
				dapui.setup({
					expand_lines = false,
					layouts = {
						{
							position = "left",
							size = 0.2,
							elements = {
								{ id = "stacks", size = 0.2 },
								{ id = "scopes", size = 0.5 },
								{ id = "breakpoints", size = 0.15 },
								{ id = "watches", size = 0.15 },
							},
						},
						{
							position = "bottom",
							size = 0.2,
							elements = {
								{ id = "repl", size = 0.3 },
								{ id = "console", size = 0.7 },
							},
						},
					},
				})

				-- Custom breakpoint icons
				vim.fn.sign_define(
					"DapBreakpoint",
					{ text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
				)
				vim.fn.sign_define("DapBreakpointCondition", {
					text = "",
					texthl = "DapBreakpointCondition",
					linehl = "DapBreakpointCondition",
					numhl = "DapBreakpointCondition",
				})
				vim.fn.sign_define(
					"DapStopped",
					{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
				)

				-- keymaps
				local start_over = function()
					pcall(function()
						dap.terminate()
					end)
					vim.defer_fn(function()
						pcall(function()
							dap.continue()
						end)
					end, 500)
				end
				vim.keymap.set("n", "<F1>", function()
					dapui.toggle({ reset = true })
				end, { desc = "DAP: Toggle UI" })
				vim.keymap.set("n", "<F2>", dap.continue, { desc = " Start/Continue" })
				vim.keymap.set("n", "<F3>", dap.step_into, { desc = " Step into" })
				vim.keymap.set("n", "<F4>", dap.step_over, { desc = " Step over" })
				vim.keymap.set("n", "<F5>", dap.step_out, { desc = " Step out" })
				vim.keymap.set("n", "<leader>dq", dap.close, { desc = "DAP: Close session" })
				vim.keymap.set("n", "<leader>dr", dap.restart_frame, { desc = "DAP: Restart frame" })
				vim.keymap.set("n", "<F6>", start_over, { desc = "DAP: Start over" })
				vim.keymap.set("n", "<F7>", dap.terminate, { desc = " Terminate session" })
				vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "DAP: Run to Cursor" })
				vim.keymap.set("n", "<leader>dR", dap.repl.toggle, { desc = "DAP: Toggle REPL" })
				vim.keymap.set("n", "<leader>dh", require("dap.ui.widgets").hover, { desc = "DAP: Hover" })
				vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Breakpoint" })
				vim.keymap.set("n", "<leader>dB", function()
					local input = vim.fn.input("Condition for breakpoint:")
					dap.set_breakpoint(input)
				end, { desc = "DAP: Conditional Breakpoint" })
				vim.keymap.set("n", "<leader>dD", dap.clear_breakpoints, { desc = "DAP: Clear Breakpoints" })
			end,
		},
	},
}
