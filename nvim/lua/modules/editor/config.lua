local config = {}

local dap_dir = vim.fn.stdpath("data") .. "/dapinstall/"
local sessions_dir = vim.fn.stdpath("data") .. "/sessions/"

function config.nvim_treesitter()
    require("nvim-treesitter.configs").setup {
      -- One of "all", "maintained" (parsers with maintainers), or a list of languages
      ensure_installed = "maintained",
      -- Install languages synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- List of parsers to ignore installing
      -- ignore_install = { "javascript" },
      highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          node_decremental = '<BS>',
          scope_incremental = '<TAB>',
        }
      },
      indent = {
        enable = true
      }
    }
end

function config.vista()
    vim.api.nvim_exec(
        [[
            source ~/.config/nvim/lua/modules/editor/vimrc/vista.vimrc
        ]],
        false)
end

function config.vim_easymotion()
    vim.g.EasyMotion_smartcase = 1
    vim.api.nvim_set_keymap('n', 'ss', '<Plug>(easymotion-s2)')
end

return config
