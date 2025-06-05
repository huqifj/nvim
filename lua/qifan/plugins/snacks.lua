return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            sections = {
                { section = "header" },
                { section = "keys", padding = 1 },
                { section = "recent_files", title = "Recent files", padding = 1 },
                { section = "startup" },
            },
        },
        explorer = { enabled = true },
        -- indent = { enabled = true },
        -- input = { enabled = true }, -- 对于输入，会弹出一个浮窗
        notifier = { enabled = true },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        -- scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        -- animate ={enabled = true},
        -- bufdelete ={enabled = true},
        -- debug ={enabled = true},
        -- dim ={enabled = true},
        -- git ={enabled = true},
        -- gitbrowse ={enabled = true},
        -- image ={enabled = true},
        -- layout ={enabled = true},
        -- lazygit ={enabled = true},
        -- notify ={enabled = true},
        -- profiler ={enabled = true},
        -- rename ={enabled = true},
        -- scratch ={enabled = true},
        -- terminal ={enabled = true},
        -- toggle ={enabled = true},
        -- util ={enabled = true},
        -- win ={enabled = true},
        -- zen ={enabled = true},
    },

    -- stylua: ignore
    keys = {
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },

        -- Top Pickers & Explorer
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    }
}
