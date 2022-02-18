local editor = {}
local conf = require("modules.editor.config")

-- 高亮
-- https://github.com/nvim-treesitter/nvim-treesitter
editor["nvim-treesitter/nvim-treesitter"] = {
    opt = false,
    run = ":TSUpdate",
    -- event = "BufRead",
    config = conf.nvim_treesitter,
}

-- 侧边函数导航
-- https://github.com/liuchengxu/vista.vim
editor["liuchengxu/vista.vim"] = {
    opt = false,
    config = conf.vista
}

-- 快速跳转
-- https://github.com/easymotion/vim-easymotion
editor["easymotion/vim-easymotion"] = {
    opt = false,
    config = conf.vim_easymotion
}

-- 导航状态栏
-- https://github.com/SmiteshP/nvim-gps
editor["SmiteshP/nvim-gps"] = {
    opt = false,
    after = "nvim-treesitter",
    config = conf.nvim_gps,
}

-- Git
-- https://github.com/tpope/vim-fugitive
editor["tpope/vim-fugitive"] = { opt = true, cmd = { "Git", "G" } }
editor["lewis6991/gitsigns.nvim"] = {
    opt = true,
    event = { "BufRead", "BufNewFile" },
    config = conf.gitsigns,
    requires = { "nvim-lua/plenary.nvim", opt = true },
}

return editor

