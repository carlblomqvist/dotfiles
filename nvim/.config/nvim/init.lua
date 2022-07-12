-- Bootstrap Packer
-- local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

--Af('BufWritePost', 'init.lua', vim.api.nvim_command('source $MYVIMRC | PackerCompile'))
--vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--  augroup end
--]])

if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
else
    require('impatient') -- load everything faster!
end

return require('packer').startup({function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'lewis6991/impatient.nvim'

    -- kill-ring behaviour TODO: replace with gbprod/yanky.nvim?
    use { 'maxbrunsfeld/vim-yankstack',
        config = function()
            vim.g.yankstack_map_keys = true
            vim.api.nvim_command('call yankstack#setup()')
        end
    }

    -- Code formatting
    require('packer').use { 'mhartington/formatter.nvim',
        config = function()
            local util = require 'formatter.util'
            require("formatter").setup {
                logging = false,
                log_level = vim.log.levels.WARN,
                filetype = {
                    lua = {
                        -- "formatter.filetypes.lua" defines default configurations for the "lua" filetype
                        require("formatter.filetypes.lua").stylua,
                        function()
                            -- Supports conditional formatting
                            if util.get_current_buffer_file_name() == "special.lua" then
                                return nil
                            end

                            return {
                                exe = "stylua",
                                args = {
                                    "--search-parent-directories",
                                    "--stdin-filepath",
                                    util.escape_path(util.get_current_buffer_file_path()),
                                    "--",
                                    "-",
                                },
                                stdin = true,
                            }
                        end
                    },

                    c = {
                        require("formatter.filetypes.c").clangformat,
                    },

                    ["*"] = {
                        -- "formatter.filetypes.any" defines default configurations for any filetype
                        require("formatter.filetypes.any").remove_trailing_whitespace
                    }
                },
            }
        end
    }

    -- Highlight Whitespace
    use { "ntpeters/vim-better-whitespace",
        config = function()
            vim.g.better_whitespace_enabled=true
            vim.g.strip_whitespace_on_save=true
        end
    }

    -- Fancy substitutions
    use { "gbprod/substitute.nvim",
        config = function()
            require("substitute").setup{}
            vim.keymap.set("n", "s",  "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
            vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
            vim.keymap.set("n", "S",  "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
            vim.keymap.set("x", "s",  "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
        end
    }

    -- yank with OSC52
    use { 'ojroques/vim-oscyank',
        config = function()
            local af = require('autofunc')
            af('TextYankPost', '*', function()
                                        if (vim.v.event.operator == 'y' and vim.v.event.regname == '' or vim.v.event.regname == '+') then
                                            vim.api.nvim_command('OSCYankReg "')
                                        end
                                    end)
            -- vim.g.oscyank_term = 'default'
            vim.g.oscyank_silent = true
        end
    }

    -- which-key!
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- TODO: config
            }
        end
    }

    use { "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup{}
        end
    }

    -- Progress information for LSP
    use { 'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup()
        end
    }

    -- Session Management -- TODO: setup properly
    use { 'Shatur/neovim-session-manager', require = 'nvim-lua/plenary.nvim',
        config = function()
            local Path = require('plenary.path')
            require('session_manager').setup({
                sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
                path_replacer = '__', -- The character to which the path separator will be replaced for session files.
                colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
                autoload_mode = require('session_manager.config').AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
                autosave_last_session = true, -- Automatically save last session on exit and on session switch.
                autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
                autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
                'gitcommit',
            },
            autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
            max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
        })
        end
    }

    -- Start-up screen
    use { 'goolord/alpha-nvim',
        config = function ()
            -- :h alpha-example
            local alpha = require'alpha'
            local dashboard = require'alpha.themes.startify'
            dashboard.section.header.val = {
                [[                                             mm                    ]],
                [[                                             @@                    ]],
                [[                                                                   ]],
                [[*@@@@@@@@m    mm@*@@   m@@*@@m *@@*   *@@* *@@@  *@@@@@@@@m@@@@@m  ]],
                [[  @@    @@   m@*   @@ @@*   *@@  @@   m@     @@    @@    @@    @@  ]],
                [[  @!    @@   !@****** @@     @@   @@ m@      !@    !@    @@    @@  ]],
                [[  @!    !@   !@m    m @@     !@    !@@       !@    !@    !@    @@  ]],
                [[  !!    !!   !!****** !@     !!    !@!       !!    !!    !!    !!  ]],
                [[  !!    !!   :!!      !!!   !!!    !!!       !!    :!    :!    !!  ]],
                [[: :::  :!: :  : : ::   : : : :      :      : : : : :!:  :::   ::!: ]],
            }
            -- TODO: add some nice buttons :)
            dashboard.section.top_buttons.val = {
                dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
                dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
            }

            dashboard.config.opts.noautocmd = true

            vim.cmd[[autocmd User AlphaReady echo 'ready']]

            alpha.setup(dashboard.config)
        end
    }

    -- Buffers per tab
    use { "tiagovla/scope.nvim",
        config = function()
            require'scope'.setup()
        end
    }


    -- Focus ("zoom") window
    use { 'nyngwang/NeoZoom.lua',
        branch = 'neo-zoom-original', -- UNCOMMENT THIS, if you prefer the old one
        config = function ()
            -- require('neo-zoom').setup { -- use the defaults or UNCOMMENT and change any one to overwrite
            -- left_ratio = 0.2,
            -- top_ratio = 0.03,
            -- width_ratio = 0.67,
            -- height_ratio = 0.9,
            -- border = 'double',
            -- exclude_filetype = {
            --   'fzf', 'qf', 'dashboard'
            -- }
            -- }
        end
    }

    -- Bufferline!
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require'bufferline'.setup{
                options = {
                    mode = "buffers",
                }
            }
        end
    }

    -- Statusline! -- TODO windwp/windline.nvim seems cool
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            --TODO: make my own :)
            require('lualine').setup {
                options = {
                    theme = 'onedark'
                    -- ... your lualine config
                }
            }
            require'evil_lualine'
        end
    }

    -- Persistant-mode
    use { 'anuvyklack/hydra.nvim',
        config = function()
            local Hydra = require('hydra')
            Hydra({
                name = 'Side scroll',
                mode = 'n',
                body = '<leader>hhw',
                heads = {
                    { '+', '+' },
                    { '-', '-', { desc = '←/→' } },
                    { '<', '<' },
                    { '>', '>', { desc = 'half screen ←/→' } },
                }
            })
        end
    --requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
    }

    -- Closes brackets/parenthesis FIXME: doesnt seem to work...?
    use { 'rstacruz/vim-closer',
        disable = true,
    }
    -- vim-easymotion replacement
    -- TODO add rhysd/clever-f.vim ?
    use { 'ggandor/lightspeed.nvim',
        config = function()
            --require.'lightspeed'.setup{
            --    jump_to_unique_chars = false,
            --    repeat_ft_with_target_char = true,
            --}
        end
    }

    -- Stabilize buffers <3
    use { "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup{
                ignore = {  -- do not manage windows matching these file/buftypes
                    filetype = { "help", "list", "Trouble" },
                    buftype = { "terminal", "quickfix", "loclist" }
                }
            }
        end
    }

    -- Ranger in neovim TODO seems to work nicely, but needs some tinkering
    -- use 'kevinhwang91/rnvimr'

    -- Surround text objects
    use 'tpope/vim-surround'

    -- Finish my sandwitches
    use 'tpope/vim-endwise'

    -- Smart comments
    use { 'numToStr/Comment.nvim',
    	config = function()
	        require('Comment').setup {
                mappings = {
                    ---Operator-pending mapping
                    ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
                    ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
                    basic = true,
                    ---Extra mapping
                    ---Includes `gco`, `gcO`, `gcA`
                    extra = true,
                    ---Extended mapping
                    ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
                    extended = false,
                },
            }
        end
	}

    -- Fuzzy file/buffer navigation
    use { 'ctrlpvim/ctrlp.vim',
        config = function()
            vim.g.ctrlp_show_hidden = 1
        end}
    -- :make replacer (:Dispatch)
    use 'tpope/vim-dispatch' -- TODO:

    -- Git for vim TODO: TimUntersberger/neogit ???
    use 'tpope/vim-fugitive'

    -- Gitgutter
    --use 'airblade/vim-gitgutter'
    use { 'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup{
                debug_mode=false, -- bad plugin! :'(
                trouble = true,
            }

        end
    }

    -- Quickfix magic
    use {'kevinhwang91/nvim-bqf', ft = 'qf'}

    -- fuzzy finder
    use {'junegunn/fzf',
        run = function()
            vim.fn['fzf#install']()
        end,
        config = function()
            vim.api.nvim_exec(
            [[
            let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }
            ]],
            true)
        end
    }
    use { 'junegunn/fzf.vim',
        config = function()
        end
    }
    use { 'ibhagwan/fzf-lua', -- allegedly better than regular fzf... Seems slow
        disable = true,
        --requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- List Errors (and other things)
    use { "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup{}
        end
    }

    -- Better syntax highlighting + token generator for other plugins
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "c", "cpp", "lua", "bash", "cmake", "comment", "dockerfile", "haskell", "json", "make", "nix", "org", "python", "rust", "yaml", "yang", "zig" },
                ignore_install = { "javascript" }, -- List of parsers to ignore installing
                highlight = {
                    enable = true,              -- false will disable the whole extension
                    disable = { "rust", "zig", "haskell" },  -- list of language that will be disabled
                    additional_vim_regex_highlighting = {'org'},
                },
                matchup = {
                    enable = true,              -- mandatory, false will disable the whole extension
                    --disable = { "c", "ruby" },  -- optional, list of language that will be disabled
                    include_match_words = false, -- enable to add highlight for /* */ comments in C among other things
                }
            }

        end
    }

    -- Mustache syntax highlighting since treesitter doesn't have it
    use 'mustache/vim-mustache-handlebars'

    -- Highlight TODO, NOTE, etc
    use { 'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup()
        end,
    }
            --require('todo-comments').setup() -- {
            --    signs = true, -- show icons in the signs column
            --    sign_priority = 8,
            --    keywords = {
            --        FIX = {
            --            icon = " ", -- icon used for the sign, and in search results
            --            color = "error", -- can be a hex color, or a named color (see below)
            --            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            --            -- signs = false, -- configure signs for some keywords individually
            --        },
            --        TODO = { icon = " ", color = "info" },
            --        HACK = { icon = " ", color = "warning" },
            --        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            --        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            --        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            --    },
            --    merge_keywords = true,
            --    highlight = {
            --        before = "", -- "fg" or "bg" or empty
            --        keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
            --        after = "fg", -- "fg" or "bg" or empty
            --        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
            --        comments_only = true, -- uses treesitter to match keywords in comments only
            --        max_line_len = 400, -- ignore lines longer than this
            --        exclude = {}, -- list of file types to exclude highlighting
            --    },
            --    -- list of named colors where we try to extract the guifg from the
            --    -- list of hilight groups or use the hex color if hl not found as a fallback
            --    colors = {
            --        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            --        warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
            --        info = { "DiagnosticInfo", "#2563EB" },
            --        hint = { "DiagnosticHint", "#10B981" },
            --        default = { "Identifier", "#7C3AED" },
            --    },
            --    search = {
            --        command = "rg",
            --        args = {
            --            "--color=never",
            --            "--no-heading",
            --            "--with-filename",
            --            "--line-number",
            --            "--column",
            --        },
            --        -- regex that will be used to match keywords.
            --        -- don't replace the (KEYWORDS) placeholder
            --        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
            --        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
            --    },
            --}
        --end
    --}

    -- Better jumping with %
    use {'andymass/vim-matchup', event = 'VimEnter',
        config = function()
        end}

    -- Fancy floating buffer/file navigation with preview
    use { 'nvim-telescope/telescope.nvim' , requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            local _theme = "ivy"
            require("telescope").setup {
                defaults = {
                    file_ignore_patterns = {"**NAMESPACE", "^.git"}
                },
                find_files = {
                    additional_args = function()
                        return {"--hidden"}
                    end
                },
                live_grep = {
                    additional_args = function()
                        return {"--hidden"}
                    end
                },
                pickers = {
                    file_browser = {
                        theme = _theme
                    },
                    buffers = {
                        theme = _theme
                    },
                    live_grep = {
                        theme = _theme
                    },
                    find_files = {
                        theme = _theme
                    },
                    current_buffer_fuzzy_find = {
                        theme = _theme
                    },
                    grep_string = {
                        theme = _theme
                    },
                    projects = {
                        theme = _theme
                    },
                },
            }
        end
    }
    -- Native FZF for telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
        config = function()
            require('telescope').setup {
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            }
            require('telescope').load_extension('fzf')
        end
    }

    -- File Browser
    use { "nvim-telescope/telescope-file-browser.nvim", requires = {{'nvim-telescope/telescope.nvim'}},
    disable = true, -- NOTE: replaced with CHADTree?
    config = function()
        require("telescope").setup {
            extensions = {
                file_browser = {
                    --theme = "ivy",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {
                            -- your custom insert mode mappings
                        },
                        ["n"] = {
                            -- your custom normal mode mappings
                        },
                    },
                },
            },
        }
        require("telescope").load_extension "file_browser"
    end
    }

    -- Project management
    use { 'ahmedkhalf/project.nvim',
        config = function()
            require("project_nvim").setup {
                detection_methods = { ">sources", ">up", "lsp", "pattern" },
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
                exclude_dirs = {},
                show_hidden = false,
                silent_chdir = false, -- false == print message when changin cwd
            }
            require('telescope').load_extension('projects')
        end
    }
    --[[
    use { "nvim-telescope/telescope-project.nvim",
    requires = {{'nvim-telescope/telescope.nvim'}, {'nvim-telescope/telescope-file-browser.nvim'}},
    config = function()
        require("telescope").setup {
            extensions = {
                project = {
                    display_type = 'minimal', -- default: full
                    hidden_files = true, -- default: false
                    base_dirs = {
                        --{ path = '/repo/eaclobr/epg', max_depth = 5 },
                        { path = '/repo/eaclobr/epg' },
                    },
                }
            },
        }
        require("telescope").load_extension "project"
    end
    }
    ]]

    -- Annotations
    use { "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        requires = "nvim-treesitter/nvim-treesitter",
    }

    use {'nvim-orgmode/orgmode', require = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('orgmode').setup({
                org_agenda_files = {'~/org/*'},
                org_default_notes_file = '~/org/todo.org',
            })
            require('orgmode').setup_ts_grammar()
        end

    }

    -- Auto-completion framework -- TODO: neoclide/coc.nvim ???
    -- also check out ray-x/navigator.lua
    use { 'ms-jpq/coq_nvim',
        branch = 'coq',
        config = function()
            vim.api.nvim_exec([[inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]], true)
            vim.api.nvim_exec([[inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]], true)
            vim.api.nvim_exec([[inoremap <silent><expr> <C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"]], true)
            vim.api.nvim_exec([[inoremap <silent><expr> <C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"]], true)
            vim.api.nvim_exec([[inoremap <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]], true)
            --let g:coq_settings = { 'auto_start': v:true }
            require("coq")
        end
    }

    use { 'ms-jpq/coq.artifacts', -- artifacts for coq_nvim
        branch = 'artifacts',
    }

    -- Like NERDtree but more chad
    use { 'ms-jpq/chadtree',
        branch = 'chad',
        run = "python3 -m chadtree deps",
        config = function()
            --
        end
    }

    -- DEPRECATED
    --use { 'nvim-lua/completion-nvim',
    --    config = function()
    --        -- Use <Tab> and <S-Tab> to navigate through popup menu
    --        vim.api.nvim_exec([[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-j>"]], true)
    --        vim.api.nvim_exec([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-k>"]], true)
    --        -- Set completeopt to have a better completion experience
    --        vim.o.completeopt= "menuone,noinsert,noselect"
    --        -- Avoid showing message extra message when using completion
    --        vim.o.shortmess = vim.o.shortmess .. "c"
    --    end}
    -- LSP
    use 'tjdevries/nlua.nvim'      -- config in lsp/init.lua
    use { 'neovim/nvim-lspconfig', -- config in lsp/init.lua
        config = function()
            -- config in lsp/init.lua
            -- TODO: move here?
        end}
    -- Theme
    use 'chriskempson/vim-tomorrow-theme'
    use 'folke/tokyonight.nvim'
    use({ "catppuccin/nvim", as = "catppuccin" })
    --use 'martinsione/darkplus.nvim' -- also kind of nice
    --use 'yong1le/darkplus.nvim' -- better than above I guess
    use { 'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup {
                style = 'warm', -- dark, darker, cool, deep, warm, warmer
                toggle_style_key = '<leader>ts', -- Default keybinding to toggle
                toggle_style_list = {'darker', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
            }
            require('onedark').load()
        end
    }
    -- use 'arcticicestudio/nord-vim'

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

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_bootstrap then
        require('packer').sync()
    end

    -- Load configuration & make sure they can be reloaded with :source
    local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
    end

    load('options')
    load('lsp')
    load('keys')
    load('style')
    --load('tools')
    --load('clipboard') -- makes tmux crash :(
    load('epg')
    vim.cmd('source ~/.config/nvim/twf.nvim')
    vim.cmd('source ~/.config/nvim/rg.nvim')

end,
config = {
    display = {
        open_fn = require('packer.util').float,
    }
}
})

