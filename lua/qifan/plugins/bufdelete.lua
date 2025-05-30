return {
    'famiu/bufdelete.nvim',

    -- Delete all but current buffer
    fdo = function()
        local bufs = vim.api.nvim_list_bufs()
        local current_buf = vim.api.nvim_get_current_buf()
        for _, i in ipairs(bufs) do
            if i ~= current_buf then
                require('bufdelete').bufdelete(i, true)
            end
        end
    end,

    keys = {
        { "<leader>bd", "<cmd>Bd<cr>", desc = "Delete Buffer" },
        { "<leader>bo", fdo, desc = "Delete Buffer" },
    },
}
