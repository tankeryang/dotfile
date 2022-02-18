local tools = {}
local conf = require("modules.tools.config")

tools["Yggdroot/LeaderF"] = {
    opt = false,
    run = "./install.sh",
    config = conf.leaderf
}

tools["brooth/far.vim"] = {
    opt = false,
    config = conf.far
}

-- 终端工具
tools["skywind3000/vim-terminal-help"] = {
    opt = false,
    config = conf.vim_terminal_help
}
tools["akinsho/toggleterm.nvim"] = {
	opt = true,
	event = "BufRead",
	config = conf.toggleterm,
}

return tools
