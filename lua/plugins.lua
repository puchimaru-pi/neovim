local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


--んなー
require("lazy").setup({
    --colorscheme
    {
        'rose-pine/neovim',
        name = 'rose-pine'
    },

    --statusline
    {
        'nvim-lualine/lualine.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            --require('lualine').setup()
            require('pluginconfig/lualine')
        end
    },

    --auto completion
    {
        'hrsh7th/nvim-cmp',
        event = 'VimEnter',
        config = function()
            require('pluginconfig/nvim-cmp')
        end,
        dependencies = {
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-emoji' },
            { 'hrsh7th/cmp-calc' },
            { 'uga-rosa/cmp-dictionary' },
            { 'hrsh7th/cmp-cmdline' },
            { 
                'onsails/lspkind-nvim',
                config = function()
                    require('pluginconfig/lspkind-nvim')
                end,
            },  
        },
    },

    --telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        event = 'VimEnter',
        dependencies = {
            { 'nvim-lua/plenary.nvim'},
            {
                'nvim-telescope/telescope-frecency.nvim',
                config = function()
                    require('telescope').load_extension('frecency')
                end,
                dependencies = { 'kkharji/sqlite.lua' },
            },
        },
    },
})
