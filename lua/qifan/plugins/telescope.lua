return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },

    config = function()
        local telescope = require("telescope")

        -- stylua: ignore
        local keymap = vim.keymap
        keymap.set("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>",                {desc = "Find help tags" })
        keymap.set("n", "<leader>fk", ":lua require('telescope.builtin').keymaps()<cr>",                  {desc = "Find keymaps" })
        keymap.set("n", "<leader>fb", ":Telescope buffers<cr>",                                           {desc = "telescope find buffers"})
        keymap.set("n", "<leader>fc", ":Telescope grep_string<cr>",                                       {desc = "Find string under cursor in cwd"})
        keymap.set("n", "<leader>ff", ":Telescope find_files<cr>",                                        {desc = "Fuzzy find files in cwd"})
        keymap.set("n", "<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true<cr>", {desc = "telescope find all files"})
        keymap.set("n", "<leader>fi", ":Telescope git_commits<cr>",                                       {desc = "telescope git commits"})
        keymap.set("n", "<leader>fm", ":Telescope marks<cr>",                                             {desc = "telescope find marks"})
        keymap.set("n", "<leader>fr", ":Telescope oldfiles<cr>",                                          {desc = "Fuzzy find recent files"})
        keymap.set("n", "<leader>fs", ":Telescope live_grep<cr>",                                         {desc = "Find string in cwd"})
        keymap.set("n", "<leader>ft", ":TodoTelescope<cr>",                                               {desc = "Find todos"})
        keymap.set("n", "<leader>fu", ":Telescope git_status<cr>",                                        {desc = "telescope git status"})
        keymap.set("n", "<leader>fz", ":Telescope current_buffer_fuzzy_find<cr>",                         {desc = "telescope find in current buffer"})
        keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", {desc = "Live grep with args"})

        telescope.load_extension("fzf")
        -- telescope.load_extension("live_grep_args")
    end
}
