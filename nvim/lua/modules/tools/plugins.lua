local tools = {}
local conf = require("modules.tools.config")

tools["Yggdroot/LeaderF"] = {
    opt = true,
    run = "./install.sh",
    config = conf.leaderf
}

tools["brooth/far.vim"] = {
    opt = false,
    config = conf.far
}

tools["skywind3000/vim-terminal-help"] = {
    opt = false,
    config = conf.vim_terminal_help
}

return tools
