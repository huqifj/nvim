vim.g.mapleader = ' '
vim.g.maplocalleader = ' '



-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.o.relativenumber = true
-- 如果不添加这行，不会显示当前实际行号，会显示 0
vim.o.number = true
-- 最少显示 2 列（默认是 4）
vim.opt.numberwidth = 2

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false


-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- 换行显示时，后续的行跟随第一行的缩进
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true


-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true


-- Keep signcolumn on by default
-- 固定显示两个纵列的标号宽度，即使没有标号
vim.o.signcolumn = 'yes'


-- Decrease update time
-- 若这么多毫秒没有按键，则保存交换文件
vim.o.updatetime = 250


-- Decrease mapped sequence wait time
-- Time in milliseconds to wait for a mapped sequence to complete
vim.o.timeoutlen = 300


-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
--   vim.opt 提供了一种方便配置 list 或 map 型参数的接口
--   以下代码类似于：vim.o.listchars = 'space:_,tab:>~'
vim.o.list = true -- 显示空白字符
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }



-- Preview substitutions live, as you type!
-- 查找替换时在一个分离的窗口显示实时预览
vim.o.inccommand = 'split'


-- Show which line your cursor is on
vim.o.cursorline = true


-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10


-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- tree style listing
vim.cmd("let g:netrw_liststyle = 3")


-- [options]

-- 如果不设置这个，隐藏一个未保存的 buffer 时，会弹出未保存提示
vim.opt.hidden = true


vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4


-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

vim.opt.wrap = false


vim.opt.hlsearch = true

