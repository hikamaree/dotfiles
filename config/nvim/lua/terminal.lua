local M = {
	terminal_buf = nil,
	terminal_win = nil
}
function M.toggle()
    if M.terminal_win and vim.api.nvim_win_is_valid(M.terminal_win) then
        vim.api.nvim_win_close(M.terminal_win, true)
        M.terminal_win = nil
    else
        vim.cmd([[bo sp | res 15]])
        if not M.terminal_buf or not vim.api.nvim_buf_is_valid(M.terminal_buf) then
            M.terminal_buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_set_current_buf(M.terminal_buf)
            vim.fn.termopen(os.getenv("SHELL") or "/bin/sh", {buffer = M.terminal_buf})
        end
        M.terminal_win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(M.terminal_win, M.terminal_buf)
        vim.cmd([[setlocal nonu nornu signcolumn=no | startinsert]])
    end
end

return M
