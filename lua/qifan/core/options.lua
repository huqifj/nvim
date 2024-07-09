vim.cmd("let g:netrw_liststyle = 3")

vim.g.have_nerd_font = false

-- [options]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

vim.opt.hidden = true

vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

vim.opt.breakindent = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartcase = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.signcolumn = "yes"

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.opt.updatetime = 250

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.opt.hlsearch = true
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local is_windows = vim.fn.has("win32") ~= 0
if is_windows then
	vim.o.shell = "powershell.exe"
end
