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
}
