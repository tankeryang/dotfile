local editor = {}
local conf = require("modules.editor.config")

-- 高亮
-- https://github.com/nvim-treesitter/nvim-treesitter
editor["nvim-treesitter/nvim-treesitter"] = {
    opt = true,
    run = ":TSUpdate",
    event = "BufRead",
    config = conf.nvim_treesitter,
}

-- 侧边函数导航
-- https://github.com/liuchengxu/vista.vim
editor["liuchengxu/vista"] = {
    opt = false,
    config = conf.vista
}

-- 快速跳转
-- https://github.com/easymotion/vim-easymotion
editor["easymotion/vim-easymotion"] = {
    opt = false,
    config = conf.vim_easymotion
}

return editor

