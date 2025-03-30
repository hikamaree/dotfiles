return {
	cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
	root_markers = { "compile_commands.json" },
	filetypes = { "c", "cpp" },
}
