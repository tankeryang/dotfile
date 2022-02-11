local config = {}

function config.leaderf()
    vim.api.nvim_exec(
        [[
            source ~/.config/nvim/lua/modules/tools/vimrc/leaderf.vimrc
        ]],
        false)
end

function far()
    vim.g["far#enable_undo"] = 1
    vim.g["far#source"] = 'ag'
end

function config.vim_terminal_help()
    vim.g.terminal_height = 24
    vim.g.terminal_list = 2048
end

return config
