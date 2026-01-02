return {
	cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose", "--fallback-style=clang-format" },
	root_markers = { ".clangd", "compile_commands.json" },
	filetypes = { "c", "h", "cpp", "hpp" },
}
