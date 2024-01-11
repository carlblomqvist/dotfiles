local bind = require('binds')
local wk   = require("which-key")
-- local Hydra = require('hydra') -- TODO: set up some hydras

-- Remove unwanted keymaps from plugins
--vim.keymap.del('n', '<C-h>') -- COQ

-- easy buffer switching (ctrl + direction to switch buffer)
bind('n', '<C-J>', '<C-W><C-J>', 'noremap')
bind('n', '<C-K>', '<C-W><C-K>', 'noremap')
bind('n', '<C-L>', '<C-W><C-L>', 'noremap')
bind('n', '<C-H>', '<C-W><C-H>')

-- Y should function like C and D
bind('n', 'Y', 'y$', 'noremap')

-- Alt-, is my muscle-memory to jump back
bind('n', '<M-,>', '<C-o>', 'noremap')

-- Hide search highlight when pressing ESC
bind('n', '<esc>', '<cmd>noh<cr><esc>', 'noremap')
bind('t', '<leader><esc>', '<C-\\><C-n><esc>', 'noremap') -- Escape from Terminal Mode

-- Try to indent well when pasting
bind('n', 'p', 'p=`]`[', 'noremap')
bind('n', 'P', 'P=`]`[', 'noremap')

-- Goto next function also centers view
bind('n', ']]', ']]zz', 'noremap')

-- Paste whatever is yanked in visual mode with P
bind('v', 'P', '"0p', 'noremap')

-- Cycle paste-history (with vim-yankstack)
--bind('n', '<M-y>', '<Plug>yankstack_substitute_older_paste')
--bind('n', 'p', '<Plug>yankstack_substitute_older_paste')

-- Lightspeed Keybindings
bind('n', 's', '<Plug>Lightspeed_s', 'noremap')
bind('n', 'S', '<Plug>Lightspeed_S', 'noremap')

------------------ Leader bindings ------------------
local opt = { expr = true, remap = true }
local api = require('Comment.api')
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
--local config = require('Comment.config'):get()
vim.keymap.set('n', '<leader>cl', api.toggle.linewise.current)
vim.keymap.set('n', '<leader>cb', api.toggle.blockwise.current)
-- Toggle selection (linewise)
vim.keymap.set('x', '<leader>cl', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
end)
-- Toggle selection (blockwise)
vim.keymap.set('x', '<leader>cb', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.blockwise(vim.fn.visualmode())
end)

wk.register({ -- Normal Mode Keybindings
    -- Buffers
    b = {
        name = "Buffers",
        B = { "<cmd>CtrlPBuffer<cr>", "Switch Buffer" },
        b = { "<cmd>Buffers<cr>", "Switch Buffer" },
        c = { "<cmd>cd %:p:h<cr>", "cd %:p:h" },
        k = { "<cmd>bp<bar>bd#<cr>", "Unload (kill) buffer" },
        K = { "<cmd>bp<bar>bd!#<cr>", "Force unload (kill) buffer" },
        n = { "<cmd>bn<cr>", "Next Buffer" },
        N = { "<cmd>enew<cr>", "New Buffer" },
        O = { "<cmd>%bd|e#|bd#<cr>", "Kill all other buffers" },
        p = { "<cmd>bp<cr>", "Previous Buffer" },
        S = { "<cmd>wa<cr>", "Save All Buffers" },
        -- TODO save all: separate bb and bB?
    },

    -- Code
    c = {
        name = "Code",
        a = { "<cmd>Neogen<cr>", "Annotate function" },
        b = { "Comment Line as Block" },
        c = { "<cmd>COQnow<cr>", "COQnow" },
        f = { "[[V%:'<,'>Format<cr>", "Format function"},
        l = { "Comment Line" },
        L = { function() vim.fn.NERDComment('n', 'ToEOL') end, "Comment to EOL" },
    },

    -- Errors
    e = {
        name = "Errors",
        e = { "<cmd>TroubleToggle document_diagnostics<cr>", "List Errors in buffer" },
        t = { "<cmd>TodoTrouble cwd=%:p:h<cr>", "List TODOs in %:p:h" },
        n = { function() require('trouble').next({skip_groups = true, jump = true}) end, "Next Error" },
        p = { function() require('trouble').previous({skip_groups = true, jump = true}) end, "Previous Error" },
        q = { "<cmd>TroubleToggle quickfix<cr>", "List Quickfix in buffer" },
    },

    -- File
    f = {
        name = "File", -- optional group name
        b = { "<cmd>Telescope file_browser path=%:p:h<cr>", "File Browser" },
        --f = { "<cmd>CtrlP<cr>", "Find File in CWD (CtrlP)" },
        f = { "<cmd>Files %:p:h/..<cr>", "Find File in %:p:h (fzf)" },
        F = { function() require("telescope").extensions.menufacture.find_files({search_dirs={vim.fn.expand("%:p:h")}}) end, "Find File in Current Dir" },
        -- F = { function()
        --         require('telescope').extensions.menufacture.add_menu_with_default_mapping(
        --         require('telescope.builtin').find_files,
        --         vim.tbl_extend('force', require('telescope').extensions.menufacture.find_files_menu, {
        --             ['change cwd to parent'] = function(opts, callback)
        --                 local cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
        --                 opts.cwd = vim.fn.fnamemodify(cwd, ':p:h:h')
        --                 callback(opts)
        --             end
        --             })
        --         )
        --     end, "Find File in Current Dir" },
        g = { "<cmd>GFiles %:p:h/..<cr>", "Find Files in Repo" }, -- create a binding with label
        h = { function() require("telescope").extensions.menufacture.find_files({search_dirs={"/home/eaclobr"}, find_command={"fd", "-E", "epg/", "--hidden"}}) end, "Find File in ~/" },
        --h = { "<cmd>Telescope find_files path=/home/eaclobr hidden=true follow=false<cr>", "Find Files in ~/" }, -- create a binding with label
        p = { "<cmd>e $MYVIMRC<cr>", "Edit init.lua" },
        P = { "<cmd>Files ~/.config<cr>", "Edit .config" },
        r = { "<cmd>lua require('telescope').extensions.frecency.frecency()<cr>", "Open Frecent File" },
        R = { "<cmd>History<cr>", "Open Recent File" },
        o = { "<cmd>CHADopen<cr>", "CHADtree" },
        R = { "<cmd>source $MYVIMRC<cr>", "Reload init.lua" },
        s = { "<cmd>w<cr>", "Save buffer" },
        S = { "<cmd>w !sudo tee % >/dev/null<cr>", "Save buffer as sudo" },
        -- TODO browse private config fP
    },

    -- Git
    g = {
        name = "Git",
        b = { function() vim.cmd('Gitsigns blame_line') end, "Blame Line" },
        g = { function() vim.cmd('Git') end, ":Git" },
        u = { function() vim.cmd('Gitsigns undo_stage_hunk') end, "Undo Hunk" },
        r = { function() vim.cmd('Gitsigns reset_hunk') end, "Reset Hunk" },
        s = { function() vim.cmd('Gitsigns stage_hunk') end, "Stage Hunk" },
        S = { function() vim.cmd('GFiles?') end, "Git Status (fzf)" },
        n = { function() vim.cmd('Gitsigns next_hunk') end, "Next Hunk" },
        p = { function() vim.cmd('Gitsigns previous_hunk') end, "Previous Hunk" },
    },

    -- Help
    h = {
        name = "Help",
        d = {
            name = "\"Doom\"",
            i = { function() vim.cmd('source "$MYVIMRC"') vim.cmd('PackerInstall') end, "Install Plugins" },
            r = { function() vim.cmd('source "$MYVIMRC"') vim.cmd('PackerCompile') end, "Sync Plugins" },
            R = { function() vim.cmd('source "$MYVIMRC"') vim.cmd('PackerSync') end, "Deep Sync Plugins" },
            t = { "<cmd>Colors<cr>", "Pick Colorscheme" },
        },
        t = { "<cmd>Telescope help_tags<cr>", "Tags" },
        m = {
            name = "Keymaps",
            m = { "<cmd>Maps<cr>", "Normal Mode" },
            n = { "<cmd>Maps<cr>", "Normal Mode" },
            v = { "<cmd>call fzf#vim#maps('x')<cr>", "Visual Mode" },
            i = { "<cmd>call fzf#vim#maps('i')<cr>", "Insert Mode" },
        }
    },

    -- Substitute
    j = {
        name = "Substitute",
        s = { "<cmd>require('substitute.range').word<cr>", "Substitute word under cursor within <range>" }
    },

    k = {
        name = "Ericsson",
        b = {
            name = "Build",
            ["3"] = { "<cmd>Dispatch git clean -xdf -- staging/.bundle/Linux_x86_64 staging/Linux_x86_64 3pp/build/Linux_x86_64 && build -g -c Linux_x86_64.clang<cr>", "Rebuild 3pp as shared (EPG/PCG)" },
            -- b = { "function() --read some variables to get build type end", "Build" },
            e = { ":Dispatch build -c IPOS_ssc data-plane", "Build for EPG" },
            p = { "<cmd>Dispatch bob build --cpp-target=data-plane", "Build for PCG" },
        },

    },

    -- Mode
    m = {
        name = "Mode",
        b = { "<cmd>luafile %<cr>", "Evaluate Lua-buffer" },
        f = { "<cmd>Lspsaga lsp_finder<cr>", "LSP: Goto Definition" },
        g = { "<cmd>Lspsaga goto_definition<cr>", "LSP: Goto Definition" },
        h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "LSP: Signature Help" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "LSP: Goto Implementation" },
        k = { "<cmd>Lspsaga hover_doc<cr>", "LSP: Hover" },
        m = { "<cmd>Lspsaga peek_definition<cr>", "LSP: Goto Declaration" },
        n = { "<cmd>Lspsaga diagnostics_jump_next<cr>", "LSP: Goto Next" },
        p = { "<cmd>Lspsaga diagnostics_jump_prev<cr>", "LSP: Goto Prev" },
        r = { "<cmd>Lspsaga rename<cr>", "LSP: Rename" },
    },

    -- Org
    O = { "<cmd>e ~/org/todo.org<cr>", "Open todo.org" },
    P = { "<cmd>e ~/org/tips.org<cr>", "Open tips.org" },
    --o = {
    --
    --    name = "Org",
    --    o = { "<cmd>e ~/org/todo.org<cr>", "Open todo.org" },
    --},

    -- Project
    p = {
        name = "Project",
        g = { function() local current_word = vim.call('expand', '<cword>') vim.cmd("Tags " .. current_word) end, "Search in TAGS for word under cursor" },
        f = { "<cmd>GFiles<cr>", "Find Files in Project" }, -- create a binding with label
        s = { function() require("telescope").extensions.menufacture.live_grep() end, "Live Grep current project (CWD)" },
        p = { function() require("telescope").extensions.projects.projects() end, "Pick Project" },
    },

    -- Search
    s = {
        name = "Search",
        d = { function() require("telescope").extensions.menufacture.live_grep({search_dirs={vim.fn.expand("%:p:h")}}) end, "grep Current Dir" },
        f = { "<cmd>HopChar1<cr>", "Hop to Char" },
        g = { function() require("telescope").extensions.menufacture.grep_string() end, "grep for what's under cursor" },
        F = { "<cmd>HopPattern<cr>", "Hop to Pattern" },
        j = { "<cmd>Telescope lsp_document_symbols ignore_symbols=variable,field,unknown,enummember,struct,enum<cr>", "Search for function in buffer" },
        n = { "<cmd>Navbuddy<cr>", "Navbuddy" },
        s = { "<cmd>Telescope current_buffer_fuzzy_find case_mode=ignore_case<cr>", "grep Current Buffer" },
        p = { function() require("telescope").extensions.menufacture.live_grep() end, "Live Grep CWD" },
        --S = { "<cmd><cr>", "Evaluate Lua-buffer" },
    },

    -- Toggle
    t = {
        name = "Toggle / Tab",
        N = { "<cmd>tabnew<cr>", "Tab New" },
        d = { "<cmd>tabclose<cr>", "Tab Close" },
        f = { "<cmd>NeoZoomToggle<cr>", "Buffer Fullscreen" },
        i = { "<cmd>set isk+=_<cr>", "Unset _ as word" },
        n = { "<cmd>tabnext<cr>", "Tab Next" },
        p = { "<cmd>tabprevious<cr>", "Tab Previous" },
        t = { "<cmd>Twilight<cr>", "Twilight" },
        u = { "<cmd>set isk-=_<cr>", "Set _ as word" },
    },

    -- Tabs
    ["<tab>"] = {
        name = "Tabs",
        d = { "<cmd>tabclose<cr>", "Delete Tab" },
        n = { "<cmd>tabnext<cr>", "Next Tab" },
        N = { "<cmd>tabnew<cr>", "New Tab" },
        p = { "<cmd>tabprevious<cr>", "Previous Tab" },
    },

    --["."] = { "<cmd>echo 'hej'<cr>" },

    -- Windows
    w = {
        name = "Windows",
        h = { "<C-w>h", "Horizontal Split" },
        j = { "<C-w>j", "Horizontal Split" },
        k = { "<C-w>k", "Horizontal Split" },
        l = { "<C-w>l", "Horizontal Split" },
        s = { "<cmd>split<cr>", "Horizontal Split" },
        v = { "<cmd>vsplit<cr>", "Vertical Split" },
        ['='] = { "<C-w>=", "Equally High and Wide" },
        ['+'] = { "<C-w>+", "Increase height" },
        ['-'] = { "<C-w>-", "Decrease height" },
        ['>'] = { "<C-w>>", "Increase width" },
        ['<'] = { "<C-w><", "Decrease width" },
        Q = { function()
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local config = vim.api.nvim_win_get_config(win);
                    if config.relative ~= "" then
                        vim.api.nvim_win_close(win, false);
                        print('Closing window', win)
                    end
                end
              end, "Kill all floating windows" },
        -- TODO resize, =, ..
    },

    q = { function()
                for buf, i in ipairs(vim.api.nvim_list_bufs()) do
                    if(vim.api.nvim_buf_is_loaded(buf)) then
                        print("i: " .. i)
                        print("buf: " .. vim.api.nvim_buf_get_name(buf))
                    end
                end
          end, "Toggle Quickfix :(" },

    ä = { "<cmd>CellularAutomaton make_it_rain<cr>", "Make it rain" },

}, { mode = "n", prefix = "<leader>" })

wk.register({ -- Visual Mode Keybindings
    c = {
        name = "Code",
        b = { "Comment Lines as Block" },
        f = { "<cmd>'<,'>Format<cr>", "Format range"},
        l = { "Comment Lines" },
    },

    j = {
        name = "Substitute",
        s = { "<cmd>require('substitute.range').visual<cr>", "Substitute selection within <range>" },
    },
}, { mode = "v", prefix = "<leader>" })
