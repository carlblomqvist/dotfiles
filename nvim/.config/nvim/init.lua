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

    -- Faster loading of neovim
    use 'lewis6991/impatient.nvim'

    -- kill-ring behaviour TODO: replace with gbprod/yanky.nvim?
    use { 'maxbrunsfeld/vim-yankstack',
        config = function()
            vim.g.yankstack_map_keys = true
            vim.api.nvim_command('call yankstack#setup()')
        end
    }

    use {'awslabs/amazonq.nvim',
        disabled = true,
        config = function()
            require('amazonq').setup({
              ssoStartUrl = 'https://d-9367077c28.awsapps.com/start',
              ssoRegion = "eu-west-1",
              inline_suggest = false,
            })
        end
    }

    use { 'esmuellert/codediff.nvim',
        requires = {"unifTanjim/nui.nvim"},
        cmd = "CodeDiff",
        config = function()
            require("codediff").setup({
              -- Highlight configuration
              highlights = {
                -- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
                line_insert = "DiffAdd",      -- Line-level insertions
                line_delete = "DiffDelete",   -- Line-level deletions

                -- Character-level: accepts highlight group names or hex colors
                -- If specified, these override char_brightness calculation
                char_insert = nil,            -- Character-level insertions (nil = auto-derive)
                char_delete = nil,            -- Character-level deletions (nil = auto-derive)

                -- Brightness multiplier (only used when char_insert/char_delete are nil)
                -- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
                char_brightness = nil,        -- Auto-adjust based on your colorscheme

                -- Conflict sign highlights (for merge conflict views)
                -- Accepts highlight group names or hex colors (e.g., "#f0883e")
                -- nil = use default fallback chain
                conflict_sign = nil,          -- Unresolved: DiagnosticSignWarn -> #f0883e
                conflict_sign_resolved = nil, -- Resolved: Comment -> #6e7681
                conflict_sign_accepted = nil, -- Accepted: GitSignsAdd -> DiagnosticSignOk -> #3fb950
                conflict_sign_rejected = nil, -- Rejected: GitSignsDelete -> DiagnosticSignError -> #f85149
              },

              -- Diff view behavior
              diff = {
                disable_inlay_hints = true,         -- Disable inlay hints in diff windows for cleaner view
                max_computation_time_ms = 5000,     -- Maximum time for diff computation (VSCode default)
                hide_merge_artifacts = false,       -- Hide merge tool temp files (*.orig, *.BACKUP.*, *.BASE.*, *.LOCAL.*, *.REMOTE.*)
              },

              -- Explorer panel configuration
              explorer = {
                position = "left",  -- "left" or "bottom"
                width = 40,         -- Width when position is "left" (columns)
                height = 15,        -- Height when position is "bottom" (lines)
                indent_markers = true,  -- Show indent markers in tree view (│, ├, └)
                icons = {
                  folder_closed = "",  -- Nerd Font folder icon (customize as needed)
                  folder_open = "",    -- Nerd Font folder-open icon
                },
                view_mode = "list",    -- "list" or "tree"
                file_filter = {
                  ignore = {},  -- Glob patterns to hide (e.g., {"*.lock", "dist/*"})
                },
              },

              -- Keymaps in diff view
              keymaps = {
                view = {
                  quit = "q",                    -- Close diff tab
                  toggle_explorer = "<leader>b",  -- Toggle explorer visibility (explorer mode only)
                  next_hunk = "]c",   -- Jump to next change
                  prev_hunk = "[c",   -- Jump to previous change
                  next_file = "]f",   -- Next file in explorer mode
                  prev_file = "[f",   -- Previous file in explorer mode
                  diff_get = "do",    -- Get change from other buffer (like vimdiff)
                  diff_put = "dp",    -- Put change to other buffer (like vimdiff)
                },
                explorer = {
                  select = "<CR>",    -- Open diff for selected file
                  hover = "K",        -- Show file diff preview
                  refresh = "R",      -- Refresh git status
                  toggle_view_mode = "i",  -- Toggle between 'list' and 'tree' views
                },
                conflict = {
                  accept_incoming = "<leader>ct",  -- Accept incoming (theirs/left) change
                  accept_current = "<leader>co",   -- Accept current (ours/right) change
                  accept_both = "<leader>cb",      -- Accept both changes (incoming first)
                  discard = "<leader>cx",          -- Discard both, keep base
                  next_conflict = "]x",            -- Jump to next conflict
                  prev_conflict = "[x",            -- Jump to previous conflict
                  diffget_incoming = "2do",        -- Get hunk from incoming (left/theirs) buffer
                  diffget_current = "3do",         -- Get hunk from current (right/ours) buffer
                },
              },
            })
        end,
    }

    use { 'mfussenegger/nvim-dap',
    }

    use { "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            require("dapui").setup()
        end
    }

    use { 'theHamsta/nvim-dap-virtual-text',
        config = function()
            require("nvim-dap-virtual-text").setup {
                enabled = true,                        -- enable this plugin (the default)
                enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                show_stop_reason = true,               -- show stop reason when stopped for exceptions
                commented = false,                     -- prefix virtual text with comment string
                only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
                all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
                clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
                --- A callback that determines how a variable is displayed or whether it should be omitted
                --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
                --- @param buf number
                --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
                --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
                --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
                --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
                display_callback = function(variable, buf, stackframe, node, options)
                    if options.virt_text_pos == 'inline' then
                        return ' = ' .. variable.value
                    else
                        return variable.name .. ' = ' .. variable.value
                    end
                end,
                -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
                virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

                -- experimental features:
                all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
                virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
            }

        end
    }

    -- Code formatting
    use { 'mhartington/formatter.nvim',
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
                        -- require("formatter.filetypes.c").clangformat,
                        function()
                            return {
                                exe = "clang-format",
                                args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                                stdin = true,
                                cwd = vim.fn.expand("/workspace/git/eaclobr/epg/up")
                            }
                        end
                    },

                    ["*"] = {
                        -- "formatter.filetypes.any" defines default configurations for any filetype
                        require("formatter.filetypes.any").remove_trailing_whitespace
                    }
                },
            }
        end
    }

    use {"smartpde/neoscopes",
        requires = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require("neoscopes").setup({
                scopes = {
                    {
                        name = "epg",
                        dirs = {
                            "/workspace/git/eaclobr/epg",
                        },
                        on_select = function()
                            -- Change the current dir in neovim.
                            -- Run `git pull`, etc.
                        end
                    },
                    {
                        name = "common",
                        dirs = {
                            "up/common",
                        }
                    },
                    {
                        name = "3pp",
                        dirs = {
                            "3pp",
                        },
                    },
                    {
                        name = "dp",
                        dirs = {
                            "up/dp",
                        },
                    },
                    {
                        name = "lep",
                        dirs = {
                            "up/lep",
                        }
                    },
                }
            })
        end
    }

    -- Markdown renderer --
    use { "lukas-reineke/headlines.nvim",
        after = "nvim-treesitter",
        config = function()
            require("headlines").setup()
        end
    }

    -- Highlight Whitespace
    use { "ntpeters/vim-better-whitespace",
        config = function()
            vim.g.better_whitespace_enabled=true
            vim.g.strip_whitespace_on_save=true
        end
    }

    -- Highlight word under cursor
   use  { "tzachar/local-highlight.nvim",
        config = function()
        require('local-highlight').setup({
            file_types = {'c', 'python', 'cpp'},
            hlgroup = 'TSDefinitionUsage',
        })
      end
    }

    -- colorcolumn but only shows when line-length > set value
    use { "m4xshen/smartcolumn.nvim",
        config = function()
            require("smartcolumn").setup({
                  colorcolumn = "121", -- show column @ this line length
                  disabled_filetypes = { "help", "text", "markdown" },
                  custom_colorcolumn = {},
                  scope = "file",
            })
        end
    }

    -- Fancy substitutions
    use { "gbprod/substitute.nvim",
        config = function()
            require("substitute").setup{}
            -- TODO: play with different options to have dedicated keys for different motions (ex: motion1 = "iW")
            vim.keymap.set("n", "s",  "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
            vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
            vim.keymap.set("n", "S",  "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
            vim.keymap.set("x", "s",  "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
            vim.keymap.set("n", "sx", require('substitute.exchange').operator, { noremap = true })
            vim.keymap.set("n", "sxx", require('substitute.exchange').line, { noremap = true })
            vim.keymap.set("x", "X", require('substitute.exchange').visual, { noremap = true })
            -- by default: can also use ESC to cancel
            vim.keymap.set("n", "sxc", require('substitute.exchange').cancel, { noremap = true })
        end
    }

    -- Preview :norm and other things
    use { "smjonas/live-command.nvim",
    -- live-command supports semantic versioning via tags
    -- tag = "1.*",
    config = function()
        require("live-command").setup {
            commands = {
                Norm = { cmd = "norm" },
                D = { cmd = "d" },
                G = { cmd = "g" },
            },
        }
    end,
    }

    -- yank with OSC52 TODO: probably not needed in nvim >= 0.9.0
    use { 'ojroques/vim-oscyank',
        config = function()
            local af = require('autofunc')
            af('TextYankPost', '*', function()
                if (vim.v.event.operator == 'y' and vim.v.event.regname == '' or vim.v.event.regname == '+') then
                    vim.api.nvim_command('OSCYankRegister +"')
                end
            end)
            -- vim.g.oscyank_term = 'default'
            vim.g.oscyank_silent = true
        end
    }

    -- Show possible key-combinations dynamically & more!
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- TODO: config
            }
        end
    }

    -- TODO: replace with mini.pairs?
    use { "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup{}
        end
    }

    -- Progress bar/information in bottom right corner for LSP
    use { 'j-hui/fidget.nvim',
        disable = true,
        tag = 'legacy',
        config = function()
            require('fidget').setup()
        end
    }

    -- Session Management -- TODO: setup properly
    use { 'Shatur/neovim-session-manager', require = 'nvim-lua/plenary.nvim',
        disable = true,
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
        disable = true,
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
                    theme = 'onedark',
                    globalstatus = false,
                    -- ... your lualine config
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                  },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        {'filename',
                            color = { fg = '#FFFFFF'},
                        },
                    },
                    lualine_x = {
                        {'location',
                            color = { fg = '#FFFFFF'},
                        },
                    },
                    lualine_y = {},
                    lualine_z = {}
                },
            }
            require'evil_lualine'
        end
    }

    -- Easily add printing of variables
    use {
        'rareitems/printer.nvim',
        config = function()
            require('printer').setup({
                keymap = "gp",
                behavior = "insert_below", -- how operator should behave
                -- "insert_below" will insert the text below the cursor
                --  "yank" will not insert but instead put text into the default '"' register
                formatters = {
                  -- you can define your formatters for specific filetypes
                  -- by assigning function that takes two strings
                  -- one text modified by 'add_to_inside' function
                  -- second the variable (thing) you want to print out
                  -- see examples in lua/formatters.lua
                  c = function(inside, variable)
                    return string.format('logger_log(LOG_INFO, "[%%s:%%s] %s: %%s", __func__, __LINE__, %s);', inside, variable)
                  end,
                },
                -- function which modifies the text inside string in the print statement, by default it adds the path and line number
                add_to_inside = function(text)
                    return text
                    -- return string.format("%s", text)
                end,
                -- set to to indenity function to turn off the default behaviour
                -- add_to_inside = function(text)
                --     return text
                -- end,
              })
        end
    }

    -- Because sometimes we need to have a bit of fun
    use 'eandrju/cellular-automaton.nvim'

    -- Dim everything except current function
    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- Persistant-mode from emacs in neovim
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

    -- Allow dot-repeat with plugins
    use { 'tpope/vim-repeat' }

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

    -- Surround text objects TODO: possible to replace with mini.surround
    use 'tpope/vim-surround'

    -- Finish my sandwitches
    use 'tpope/vim-endwise'

    -- Smart comments TODO: possible to replace with mini.comment
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

    -- AI
    use { 'olimorris/codecompanion.nvim',
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("codecompanion").setup({
              opts = {
                log_level = "DEBUG", -- or "TRACE"
              },
              adapters = {
                http = {
                  opts = {
                    allow_insecure = true,
                    proxy = "http://127.0.0.1:7999",
                  },
                },
              },
            })
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

    -- Show git-hunks next to line numbers
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

    -- vim-functions for junegunn/fzf
    use { 'junegunn/fzf.vim',
        config = function()
        end
    }

    -- Additions to junegunn/fzf
    use { "linrongbin16/fzfx.nvim",
        disable = true,
        config = function()
            require("fzfx").setup()
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

    -- Better syntax highlighting + token generator for other plugins NOTE: included in neovim now a days?
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "c", "cpp", "lua", "bash", "cmake", "comment", "dockerfile", "haskell",
                                     "json", "make", "markdown", "markdown_inline", "nix", "python",
                                     "rust", "yaml", "yang", "zig" },
                ignore_install = { "javascript" }, -- List of parsers to ignore installing
                highlight = {
                    enable = true,              -- false will disable the whole extension
                    disable = { "zig", "haskell" },  -- list of language that will be disabled
                    additional_vim_regex_highlighting = false --{'org'},
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

    -- Highlight TODO, NOTE, etc NOTE: is pretty good, but makes some weird highlighting sometimes
    -- use { 'folke/todo-comments.nvim',
        -- requires = 'nvim-lua/plenary.nvim',
        -- config = function()
            -- require('todo-comments').setup()
        -- end,
    -- }

    -- Better jumping between matching pairs with %
    use {'andymass/vim-matchup',
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
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
                    find_command = {"fd", "-E", "epg/"},
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

    -- File Browser in telescope
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

    -- Sort by frecency in telescope
    use { "nvim-telescope/telescope-frecency.nvim",
      config = function()
        require"telescope".load_extension("frecency")
      end,
    }

    -- Menu to toggle options in telescope
    use { 'molecule-man/telescope-menufacture',
        config = function()
            require('telescope').load_extension('menufacture')
            require('telescope').setup {
              extensions = {
                menufacture = {
                  mappings = {
                    main_menu = { [{ 'i', 'n' }] = '<C-s>' },
                  },
                },
              },
            }
        end
    }

    -- Noice - pretty cmdline, notifcations etc
    --use { "folke/noice.nvim", disable=true,
        --config = function()
            --require("noice").setup({
                --cmdline = { enabled = false }
            --})
        --end,
        --requires = {
            ---- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            --"MunifTanjim/nui.nvim",
            ---- OPTIONAL:
            ----   `nvim-notify` is only needed, if you want to use the notification view.
            ----   If not available, we use `mini` as the fallback
            --"rcarriga/nvim-notify",
        --}
    --}

    -- Project management TODO: replace with mini.session?
    use { 'ahmedkhalf/project.nvim',
        disable = true;
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

    -- Emacs org-mode in neovim
    use {'nvim-orgmode/orgmode', disable = true,
        require = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('orgmode').setup({
                org_agenda_files = {'~/org/*'},
                org_default_notes_file = '~/org/todo.org',
            })
        end

    }

    -- Mini.nvim for lots of modular functionality!
    use { 'echasnovski/mini.nvim',
        config = function()
            -- require("mini.ai").setup({}) 	      -- Extend and create a/i textobjects
            require("mini.align").setup({})       -- Align text interactively
            -- local animate = require('mini.animate')  -- Animate common Neovim actions
            -- animate.setup({
                -- scroll = {
                  -- Animate for 200 milliseconds with linear easing
                  -- timing = animate.gen_timing.linear({ duration = 100, unit = 'total' }),
                  -- Animate equally but with at most 120 steps instead of default 60
                  -- subscroll = animate.gen_subscroll.equal({ max_output_steps = 50 }),
                -- },
                -- cursor = {
                  -- Animate for 200 milliseconds with linear easing
                  -- timing = animate.gen_timing.linear({ duration = 100, unit = 'total' }),
                  -- Animate equally but with at most 120 steps instead of default 60
                  -- subscroll = animate.gen_subscroll.equal({ max_output_steps = 50 }),
                -- },
            -- })
            -- require("mini.base16").setup({})      -- Base16 colorscheme creation
            -- require("mini.basics").setup({})      -- Common configuration presets
            -- require("mini.bracketed").setup({})   -- Go forward/backward with square brackets
            -- require("mini.bufremove").setup({})   -- Remove buffers TODO: could be nice
            -- require("mini.clue").setup({}) 	     -- Show next key clues TODO: "better" looking whichkey?
            -- require("mini.colors").setup({})      -- Tweak and save any color scheme
            -- require("mini.comment").setup({})     -- Comment lines TODO: switch to?
            -- require("mini.completion").setup({})  -- Completion and signature help
            -- require("mini.cursorword").setup({})  -- Autohighlight word under cursor
            -- require("mini.doc").setup({})         -- Generate Neovim help files
            -- require("mini.files").setup({})       -- Navigate and manipulate file system
            -- require("mini.fuzzy").setup({})       -- Fuzzy matching
            local hipatterns = require('mini.hipatterns') -- Highlight patterns in text
                hipatterns.setup({
                  highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
                    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
                    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                  },
                })
            -- require("mini.hues").setup({})        -- Generate configurable color scheme
            local indentscope = require("mini.indentscope") -- Visualize and work with indent scope
            indentscope.setup({
                draw = {
                    delay = 100,
                    priority = 2,
                    -- animation = function(s, n)
                    --     return s/n*200
                    -- end,
                    animation = indentscope.gen_animation.linear{ duration = 100, unit = 'total' }
                }
            })
            -- require("mini.jump").setup({})        -- Jump to next/previous single character
            -- require("mini.jump2d").setup({})      -- Jump within visible lines
            require("mini.notify").setup()         -- Window with buffer text overview
            -- require("mini.map").setup({})         -- Window with buffer text overview
            -- require("mini.misc").setup({})        -- Miscellaneous functions
            require("mini.move").setup({})        -- Move any selection in any direction
            require("mini.operators").setup({})   -- Text edit operators
            -- require("mini.pairs").setup({})       -- Autopairs TODO: replace current with this
            -- require("mini.pick").setup({})        -- Pick anything
            require("mini.sessions").setup({         -- Session management TODO: some config
                -- Whether to read latest session if Neovim opened without file arguments
                autoread = true,
                -- Whether to write current session before quitting Neovim
                autowrite = true,
                -- Directory where global sessions are stored (use `''` to disable)
                directory = '',  --<"session" subdir of user data directory from |stdpath()|>,

                -- File for local session (use `''` to disable)
                file = 'Session.vim',

                -- Whether to force possibly harmful actions (meaning depends on function)
                force = { read = false, write = true, delete = false },

                -- Hook functions for actions. Default `nil` means 'do nothing'.
                hooks = {
                    -- Before successful action
                    pre = { read = nil, write = nil, delete = nil },
                    -- After successful action
                    post = { read = nil, write = nil, delete = nil },
                },

                -- Whether to print session path after action
                verbose = { read = false, write = true, delete = true },
            })
            vim.notify = require('mini.notify').make_notify() -- Make nvim.notify the default notifier
            require("mini.splitjoin").setup({})   -- Split and join arguments
            -- require("mini.starter").setup({})     -- Start screen
            -- require("mini.statusline").setup({})  -- Statusline
            -- require("mini.surround").setup({})    -- Surround actions TODO: maybe replace current
            require("mini.tabline").setup({})     -- Tabline TODO: probably replace current
            -- require("mini.test").setup({})        -- Test Neovim plugins
            -- require("mini.trailspace").setup({})  -- Trailspace (highlight and remove)
        end,
    }


    -- *** [[LSP stuff]] *** --
    -- use 'tjdevries/nlua.nvim'      -- config in lsp/init.lua
    use { "folke/neodev.nvim",
        config = function()
            require("neodev").setup({
                -- add any options here, or leave empty to use the default settings
            })
        end
    }
    use { 'neovim/nvim-lspconfig', -- config in lsp/init.lua
        config = function()
            -- config in lsp/init.lua
            -- TODO: move here?
        end}

    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({
                lightbulb = {
                enable = false,
                enable_in_insert = false,
                sign = true,
                sign_priority = 40,
                virtual_text = true,
              },
                beacon = {
                    enable = true,
                    frequency = 30,
              },
            })
        end,
        requires = { {"nvim-tree/nvim-web-devicons"} }
    })

    -- UI component library for NVIM, cool to use for my own plugins
    use 'MunifTanjim/nui.nvim'

    -- Window to navigate between LSP-symbols
    use ({ "SmiteshP/nvim-navbuddy",
        config = function()
            require("nvim-navbuddy").setup({
                lsp = { auto_attach = false }
            })
        end,
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        }
    })

    -- Auto Completion!
    use ({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc"
        },
        config = function()
            local cmp = require'cmp'
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                  ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                  { name = 'nvim_lsp' },
                  -- { name = 'codeium' },
                  { name = 'buffer' },
                  -- { name = 'vsnip' }, -- For vsnip users.
                  -- { name = 'luasnip' }, -- For luasnip users.
                  -- { name = 'ultisnips' }, -- For ultisnips users.
                  -- { name = 'snippy' }, -- For snippy users.
                })
            })

        end
    })

    --[[ NOTE: alternative auto-completion plugin
    use({
        'ray-x/navigator.lua',
        requires = {
            { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
            { 'neovim/nvim-lspconfig' },
        },
        config = function()
            require("navigator").setup({
                icons = { icons = false },
                lsp = {
                    enable = true,
                    code_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
                    code_lens_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
                    document_highlight = true, -- LSP reference highlight
                    format_on_save = false,
                    format_options = {async=false},
                    disable_format_cap = {"sqls", "sumneko_lua", "gopls"},
                    diagnostic = {
                      underline = true,
                      signs = false,
                      virtual_text = true, -- show virtual for diagnostic message
                      update_in_insert = false, -- update diagnostic message in insert mode
                    }
                }
            })
        end
    })
    --]]

    -- Make hover windows prettier (better formatting)
    use { "Fildo7525/pretty_hover",
        config = function()
            require("pretty_hover").setup({})
        end
    }

    -- Modify files by manipulating text a neovim buffer
    use { 'stevearc/oil.nvim',
          config = function()
              require('oil').setup()
          end
    }

    use { "alexghergh/nvim-tmux-navigation",
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')

            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }

            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    }

    -- Theme
    use 'chriskempson/vim-tomorrow-theme'
    -- use 'folke/tokyonight.nvim'
    use({ "catppuccin/nvim", as = "catppuccin" })
    --use 'martinsione/darkplus.nvim' -- also kind of nice
    --use 'yong1le/darkplus.nvim' -- better than above I guess
    use { 'navarasu/onedark.nvim', disable = true,
        config = function()
            require('onedark').setup {
                style = 'warm', -- dark, darker, cool, deep, warm, warmer
                toggle_style_key = '<leader>ts', -- Default keybinding to toggle
                toggle_style_list = {'darker', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
            }
            -- require('onedark').load()
        end
    }
    use({ 'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            -- vim.cmd('colorscheme rose-pine')
        end
    })
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
    load('adapters')
    load('keys')
    load('style')
    --load('tools')
    --load('clipboard') -- makes tmux crash :(
    load('epg')
    vim.cmd('source ~/.config/nvim/twf.nvim')
    vim.cmd('source ~/.config/nvim/rg.nvim')
    vim.notify('Config reloaded!', vim.log.levels.INFO)

end,

config = {
    display = {
        open_fn = require('packer.util').float, -- run packer in a floating window
    }
}
})

