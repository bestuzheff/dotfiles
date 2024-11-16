-- Ускорение загрузки Neovim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Основные настройки
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Установите путь для плагинов
require('packer').startup(function()
    -- Менеджер плагинов
    use 'wbthomason/packer.nvim'

    -- Подсветка синтаксиса и автодополнение
    use 'neovim/nvim-lspconfig' -- LSP (языковой сервер)
    use 'hrsh7th/nvim-cmp'      -- Автодополнение
    use 'hrsh7th/cmp-nvim-lsp'  -- Источник для LSP
    use 'saadparwaiz1/cmp_luasnip' -- Источник для фрагментов
    use 'L3MON4D3/LuaSnip'      -- Фрагменты кода

    -- Подсветка синтаксиса
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Дополнительные утилиты
    use 'tpope/vim-commentary'  -- Комментирование кода
    use 'nvim-lua/plenary.nvim' -- Библиотека для плагинов
    use 'nvim-telescope/telescope.nvim' -- Файловый поиск
end)

-- Настройка LSP для Python
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}

-- Настройка автодополнения
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
})
