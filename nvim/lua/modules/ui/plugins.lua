local ui = {}
local conf = require("module.ui.config")

-- 文件目录
-- https://github.com/Shougo/defx.nvim
ui["Shougo/defx.nvim"] = {
    opt = true,
    run = ":UpdateRemotePlugins",
    requires = {"kristijanhusak/defx-git", "kristijanhusak/defx-icons"},
    config = conf.defx
}

-- 缩进美化
-- https://github.com/lukas-reineke/indent-blankline.nvim
ui["lukas-reineke/indent-blankline.nvim"] = {
    opt = true,
    event = "BufRead",
    config = conf.indent_blankline,
}

return ui
