-- local bind = require('binds')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Closes brackets/parenthesis
    use '9mm/vim-closer'
    -- vim-easymotion replacement
    use { 'phaazon/hop.nvim', as = 'hop',
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    -- Surround text objects
    use 'tpope/vim-surround'
    -- Smart comments
    use 'scrooloose/nerdcommenter'
    -- Fuzzy file/buffer navigation
    use { 'ctrlpvim/ctrlp.vim',
        config = function()
            vim.g.ctrlp_show_hidden = 1
        end}
    -- :make replacer (:Dispatch)
    use 'tpope/vim-dispatch' -- TODO
    -- Git for vim
    use 'tpope/vim-fugitive'
    -- Better syntax highlighting + token generator for other plugins
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "bash", "cmake", "dockerfile", "haskell", "nix", "python", "rust", "zig" },
                ignore_install = { "javascript" }, -- List of parsers to ignore installing
                highlight = {
                    enable = true,              -- false will disable the whole extension
                    disable = { "rust", "zig" },  -- list of language that will be disabled
                    additional_vim_regex_highlighting = false,
                },
            }
    end}
    -- Better jumping with %
    use {'andymass/vim-matchup', event = 'VimEnter',
        config = function()
            require'nvim-treesitter.configs'.setup {
              matchup = {
                enable = true,              -- mandatory, false will disable the whole extension
                --disable = { "c", "ruby" },  -- optional, list of language that will be disabled
              },
            }
        end}
    -- Fancy floating buffer/file navigation with preview
    use { 'nvim-telescope/telescope.nvim' , requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
    -- Auto-completion framework
    use { 'nvim-lua/completion-nvim',
        config = function()
            -- Use <Tab> and <S-Tab> to navigate through popup menu
            vim.api.nvim_exec([[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"]], true)
            vim.api.nvim_exec([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]], true)
            -- Set completeopt to have a better completion experience
            vim.o.completeopt= "menuone,noinsert,noselect"
            -- Avoid showing message extra message when using completion
            vim.o.shortmess = vim.o.shortmess .. "c"
        end}
    -- LSP
    use 'tjdevries/nlua.nvim'      -- config in lsp/init.lua
    use { 'neovim/nvim-lspconfig', -- config in lsp/init.lua
        config = function()
            -- config in lsp/init.lua
            -- TODO move here?
        end}
    -- Theme
    use 'arcticicestudio/nord-vim'

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    --use {
    --'w0rp/ale',
    --ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    --cmd = 'ALEEnable',
    --config = 'vim.cmd[[ALEEnable]]'
    --}

    -- Post-install/update hook with call of vimscript function with argument
    -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
end)
