return {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup {
      max_length = 0, -- 不限制复制长度
      trim = false,   -- 不裁剪尾部的空白字符
      silent = false, -- 打开时显示日志
    }

    -- 按下<leader>c即可复制选中的内容到系统剪贴板
    vim.keymap.set("v", "<leader>c", function()
      require("osc52").copy_visual()
    end, { desc = "复制选中的内容到系统剪贴板 (OSC52)" })
  end,
}

