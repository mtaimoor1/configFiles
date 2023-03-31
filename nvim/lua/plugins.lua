-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})


return require('packer').startup({
function(use)
        ---------------------
        -- Package Manager --
        ---------------------

        use('wbthomason/packer.nvim')

        ----------------------
        -- Required plugins --
        ----------------------

        use('nvim-lua/plenary.nvim')



        ----------------------------------------
        -- Theme, Icons, Statusbar, Bufferbar --
        ----------------------------------------
        use ({
                'nvim-lualine/lualine.nvim',
                requires = { 'kyazdani42/nvim-web-devicons', opt = true },
                config = function()
                    require('lualine').setup{
                        options = { theme = 'dracula' }
                        }
                end,
            })

        use ('folke/tokyonight.nvim')

        ----------------------------------------
        -- Telescope for fuzzy search --
        ----------------------------------------
        use ({
                'nvim-telescope/telescope.nvim', tag = '0.1.1',
                requires = { {'nvim-lua/plenary.nvim'} }
            })
 end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
