local tools = {}
local conf = require("modules.tools.config")

tools["Yggdroot/LeaderF"] = {
    opt = false,
    run = "./install.sh",
    config = conf.leaderf
}

tools["nvim-lua/plenary.nvim"] = { opt = false }

-- 查找替换工具
tools["brooth/far.vim"] = {
    opt = false,
    config = conf.far
}

-- 终端工具
tools["skywind3000/vim-terminal-help"] = {
    disable = true, -- 弃用
    opt = false,
    config = conf.vim_terminal_help
}
-- 终端工具
tools["akinsho/toggleterm.nvim"] = {
	opt = true,
	event = "BufRead",
	config = conf.toggleterm,
}

return tools
