local completion = {}
local conf = require("modules.completion.config")

-- neovim 原生 lsp 实现, 配置集合
-- https://github.com/neovim/nvim-lspconfig
completion["neovim/nvim-lspconfig"] = {
	opt = true,
	event = "BufReadPre",
	config = conf.nvim_lsp,
}

-- 通用的 ls 服务配置定义
-- https://github.com/creativenull/efmls-configs-nvim
completion["creativenull/efmls-configs-nvim"] = {
	opt = false,
	requires = "neovim/nvim-lspconfig",
}

-- 可视化安装 lsp-server
-- https://github.com/williamboman/nvim-lsp-installer
completion["williamboman/nvim-lsp-installer"] = {
	opt = true,
	after = "nvim-lspconfig",
}

-- nvim-lsp 简化工具(命令/快捷键)集合
-- https://github.com/RishabhRD/nvim-lsputils
completion["RishabhRD/nvim-lsputils"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.nvim_lsputils,
}

-- nvim-lsp ui 界面
-- https://github.com/tami5/lspsaga.nvim
completion["tami5/lspsaga.nvim"] = {
	opt = true,
	after = "nvim-lspconfig",
}

-- 函数预览, 类似 tagbar, vista
-- https://github.com/stevearc/aerial.nvim
completion["stevearc/aerial.nvim"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.aerial,
}

-- 提示灯泡
-- https://github.com/kosayoda/nvim-lightbulb
completion["kosayoda/nvim-lightbulb"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.lightbulb,
}

-- 输入时显示函数参数
-- https://github.com/ray-x/lsp_signature.nvim
completion["ray-x/lsp_signature.nvim"] = { opt = true, after = "nvim-lspconfig" }
completion["hrsh7th/nvim-cmp"] = {
	config = conf.cmp,
	event = "InsertEnter",
	requires = {
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
		{ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
		{ "andersevenrud/cmp-tmux", after = "cmp-nvim-lua" },
		{ "hrsh7th/cmp-path", after = "cmp-tmux" },
		{ "f3fora/cmp-spell", after = "cmp-path" },
		{ "hrsh7th/cmp-buffer", after = "cmp-spell" },
		{ "kdheepak/cmp-latex-symbols", after = "cmp-buffer" },
		-- {
		--     'tzachar/cmp-tabnine',
		--     run = './install.sh',
		--     after = 'cmp-spell',
		--     config = conf.tabnine
		-- }
	},
}

-- 代码片段
-- https://github.com/L3MON4D3/LuaSnip
completion["L3MON4D3/LuaSnip"] = {
	after = "nvim-cmp",
	config = conf.luasnip,
	requires = "rafamadriz/friendly-snippets",
}

-- 括号自动匹配
-- https://github.com/windwp/nvim-autopairs
completion["windwp/nvim-autopairs"] = {
	after = "nvim-cmp",
	config = conf.autopairs,
}

-- 代码智能提示
completion["github/copilot.vim"] = { opt = true, cmd = "Copilot" }

return completion
