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

wk.add({
    { "<leader><tab>", group = "Tabs" },
    { "<leader><tab>N", "<cmd>tabnew<cr>", desc = "New Tab" },
    { "<leader><tab>d", "<cmd>tabclose<cr>", desc = "Delete Tab" },
    { "<leader><tab>n", "<cmd>tabnext<cr>", desc = "Next Tab" },
    { "<leader><tab>p", "<cmd>tabprevious<cr>", desc = "Previous Tab" },
    { "<leader>O", "<cmd>e ~/org/todo.org<cr>", desc = "Open todo.org" },
    { "<leader>P", "<cmd>e ~/org/tips.org<cr>", desc = "Open tips.org" },
    { "<leader>b", group = "Buffers" },
    { "<leader>bB", "<cmd>CtrlPBuffer<cr>", desc = "Switch Buffer" },
    { "<leader>bK", "<cmd>bp<bar>bd!#<cr>", desc = "Force unload (kill) buffer" },
    { "<leader>bN", "<cmd>enew<cr>", desc = "New Buffer" },
    { "<leader>bO", "<cmd>%bd|e#|bd#<cr>", desc = "Kill all other buffers" },
    { "<leader>bS", "<cmd>wa<cr>", desc = "Save All Buffers" },
    { "<leader>bb", "<cmd>Buffers<cr>", desc = "Switch Buffer" },
    { "<leader>bc", "<cmd>cd %:p:h<cr>", desc = "cd %:p:h" },
    { "<leader>bk", "<cmd>bp<bar>bd#<cr>", desc = "Unload (kill) buffer" },
    { "<leader>bn", "<cmd>bn<cr>", desc = "Next Buffer" },
    { "<leader>bp", "<cmd>bp<cr>", desc = "Previous Buffer" },
    { "<leader>c", group = "Code" },
    { "<leader>cL", function() vim.fn.NERDComment('n', 'ToEOL') end, desc = "Comment to EOL" },
    { "<leader>ca", "<cmd>Neogen<cr>", desc = "Annotate function" },
    { "<leader>cb", desc = "Comment Line as Block" },
    { "<leader>cc", "<cmd>COQnow<cr>", desc = "COQnow" },
    { "<leader>cf", "[[V%:'<,'>Format<cr>", desc = "Format function" },
    { "<leader>cl", desc = "Comment Line" },
    { "<leader>e", group = "Errors" },
    { "<leader>ee", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "List Errors in buffer" },
    { "<leader>en", function() require('trouble').next({skip_groups = true, jump = true}) end, desc = "Next Error" },
    { "<leader>ep", function() require('trouble').previous({skip_groups = true, jump = true}) end, desc = "Previous Error" },
    { "<leader>eq", "<cmd>TroubleToggle quickfix<cr>", desc = "List Quickfix in buffer" },
    { "<leader>et", "<cmd>TodoTrouble cwd=%:p:h<cr>", desc = "List TODOs in %:p:h" },
    { "<leader>f", group = "File" },
    { "<leader>fF", function() require("telescope").extensions.menufacture.find_files({search_dirs={vim.fn.expand("%:p:h")}}) end, desc = "Find File in Current Dir" },
    { "<leader>fP", "<cmd>Files ~/.config<cr>", desc = "Edit .config" },
    { "<leader>fR", "<cmd>source $MYVIMRC<cr>", desc = "Reload init.lua" },
    { "<leader>fS", "<cmd>w !sudo tee % >/dev/null<cr>", desc = "Save buffer as sudo" },
    { "<leader>fb", "<cmd>Telescope file_browser path=%:p:h<cr>", desc = "File Browser" },
    { "<leader>ff", "<cmd>Files %:p:h/..<cr>", desc = "Find File in %:p:help |(fzf)|" },
    { "<leader>fg", "<cmd>GFiles %:p:h/..<cr>", desc = "Find Files in Repo" },
    { "<leader>fh", function() require("telescope").extensions.menufacture.find_files({search_dirs={"/home/eaclobr"}, find_command={"fd", "-E", "epg/", "--hidden"}}) end, desc = "Find File in ~/" },
    { "<leader>fo", "<cmd>CHADopen<cr>", desc = "CHADtree" },
    { "<leader>fp", "<cmd>e $MYVIMRC<cr>", desc = "Edit init.lua" },
    { "<leader>fr", "<cmd>lua require('telescope').extensions.frecency.frecency()<cr>", desc = "Open Frecent File" },
    { "<leader>fs", "<cmd>w<cr>", desc = "Save buffer" },
    { "<leader>g", group = "Git" },
    { "<leader>gS", function() vim.cmd('GFiles?') end, desc = "Git Status (fzf)" },
    { "<leader>gb", function() vim.cmd('Gitsigns blame_line') end, desc = "Blame Line" },
    { "<leader>gg", function() vim.cmd('Git') end, desc = ":Git" },
    { "<leader>gn", function() vim.cmd('Gitsigns next_hunk') end, desc = "Next Hunk" },
    { "<leader>gp", function() vim.cmd('Gitsigns previous_hunk') end, desc = "Previous Hunk" },
    { "<leader>gr", function() vim.cmd('Gitsigns reset_hunk') end, desc = "Reset Hunk" },
    { "<leader>gs", function() vim.cmd('Gitsigns stage_hunk') end, desc = "Stage Hunk" },
    { "<leader>gu", function() vim.cmd('Gitsigns undo_stage_hunk') end, desc = "Undo Hunk" },
    { "<leader>h", group = "Help" },
    { "<leader>hd", group = '"Doom"' },
    { "<leader>hdR", function() vim.cmd('source "$MYVIMRC"') vim.cmd('PackerSync') end, desc = "Deep Sync Plugins" },
    { "<leader>hdi", function() vim.cmd('source "$MYVIMRC"') vim.cmd('PackerInstall') end, desc = "Install Plugins" },
    { "<leader>hdr", function() vim.cmd('source "$MYVIMRC"') vim.cmd('PackerCompile') end, desc = "Sync Plugins" },
    { "<leader>hdt", "<cmd>Colors<cr>", desc = "Pick Colorscheme" },
    { "<leader>hm", group = "Keymaps" },
    { "<leader>hmi", "<cmd>call fzf#vim#maps('i')<cr>", desc = "Insert Mode" },
    { "<leader>hmm", "<cmd>Maps<cr>", desc = "Normal Mode" },
    { "<leader>hmn", "<cmd>Maps<cr>", desc = "Normal Mode" },
    { "<leader>hmv", "<cmd>call fzf#vim#maps('x')<cr>", desc = "Visual Mode" },
    { "<leader>ht", "<cmd>Telescope help_tags<cr>", desc = "Tags" },
    { "<leader>j", group = "Substitute" },
    { "<leader>js", "<cmd>require('substitute.range').word<cr>", desc = "Substitute word under cursor within <range>" },
    { "<leader>k", group = "Ericsson" },
    { "<leader>kb", group = "Build" },
    { "<leader>kb3", "<cmd>Dispatch git clean -xdf -- staging/.bundle/Linux_x86_64 staging/Linux_x86_64 3pp/build/Linux_x86_64 && build -g -c Linux_x86_64.clang<cr>", desc = "Rebuild 3pp as shared (EPG/PCG)" },
    { "<leader>kbe", ":Dispatch build -c IPOS_ssc data-plane", desc = "Build for EPG" },
    { "<leader>kbp", "<cmd>Dispatch bob build --cpp-target=data-plane", desc = "Build for PCG" },
    { "<leader>m", group = "Mode" },
    { "<leader>mb", "<cmd>luafile %<cr>", desc = "Evaluate Lua-buffer" },
    { "<leader>mf", "<cmd>Lspsaga lsp_finder<cr>", desc = "LSP: Goto Definition" },
    { "<leader>mg", "<cmd>Lspsaga goto_definition<cr>", desc = "LSP: Goto Definition" },
    { "<leader>mh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "LSP: Signature Help" },
    { "<leader>mi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "LSP: Goto Implementation" },
    { "<leader>mk", "<cmd>Lspsaga hover_doc<cr>", desc = "LSP: Hover" },
    { "<leader>mm", "<cmd>Lspsaga peek_definition<cr>", desc = "LSP: Goto Declaration" },
    { "<leader>mn", "<cmd>Lspsaga diagnostics_jump_next<cr>", desc = "LSP: Goto Next" },
    { "<leader>mp", "<cmd>Lspsaga diagnostics_jump_prev<cr>", desc = "LSP: Goto Prev" },
    { "<leader>mr", "<cmd>Lspsaga rename<cr>", desc = "LSP: Rename" },
    { "<leader>p", group = "Project" },
    { "<leader>pf", "<cmd>GFiles<cr>", desc = "Find Files in Project" },
    { "<leader>pg", function() local current_word = vim.call('expand', '<cword>') vim.cmd("Tags " .. current_word) end, desc = "Search in TAGS for word under cursor" },
    { "<leader>pp", function() require("telescope").extensions.projects.projects() end, desc = "Pick Project" },
    { "<leader>ps", function() require("telescope").extensions.menufacture.live_grep() end, desc = "Live Grep current project (CWD)" },
    { "<leader>q", function()
                        for buf, i in ipairs(vim.api.nvim_list_bufs()) do
                            if(vim.api.nvim_buf_is_loaded(buf)) then
                                print("i: " .. i)
                                print("buf: " .. vim.api.nvim_buf_get_name(buf))
                            end
                        end
                   end, desc = "Toggle Quickfix :(" },
    { "<leader>s", group = "Search" },
    { "<leader>sF", "<cmd>HopPattern<cr>", desc = "Hop to Pattern" },
    { "<leader>sd", function() require("telescope").extensions.menufacture.live_grep({search_dirs={vim.fn.expand("%:p:h")}}) end, desc = "grep Current Dir" },
    { "<leader>sf", "<cmd>HopChar1<cr>", desc = "Hop to Char" },
    { "<leader>sg", function() require("telescope").extensions.menufacture.grep_string() end, desc = "grep for what's under cursor" },
    { "<leader>sj", "<cmd>Telescope lsp_document_symbols ignore_symbols=variable,field,unknown,enummember,struct,enum<cr>", desc = "Search for function in buffer" },
    { "<leader>sn", "<cmd>Navbuddy<cr>", desc = "Navbuddy" },
    { "<leader>sp", function() require("telescope").extensions.menufacture.live_grep() end, desc = "Live Grep CWD" },
    { "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find case_mode=ignore_case<cr>", desc = "grep Current Buffer" },
    { "<leader>t", group = "Toggle / Tab" },
    { "<leader>tN", "<cmd>tabnew<cr>", desc = "Tab New" },
    { "<leader>td", "<cmd>tabclose<cr>", desc = "Tab Close" },
    { "<leader>tf", "<cmd>NeoZoomToggle<cr>", desc = "Buffer Fullscreen" },
    { "<leader>ti", "<cmd>set isk+=_<cr>", desc = "Unset _ as word" },
    { "<leader>tn", "<cmd>tabnext<cr>", desc = "Tab Next" },
    { "<leader>tp", "<cmd>tabprevious<cr>", desc = "Tab Previous" },
    { "<leader>tt", "<cmd>Twilight<cr>", desc = "Twilight" },
    { "<leader>tu", "<cmd>set isk-=_<cr>", desc = "Set _ as word" },
    { "<leader>w", group = "Windows" },
    { "<leader>w+", "<C-w>+", desc = "Increase height" },
    { "<leader>w-", "<C-w>-", desc = "Decrease height" },
    { "<leader>w<", "<C-w><", desc = "Decrease width" },
    { "<leader>w=", "<C-w>=", desc = "Equally High and Wide" },
    { "<leader>w>", "<C-w>>", desc = "Increase width" },
    { "<leader>wQ", function()
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local config = vim.api.nvim_win_get_config(win);
                    if config.relative ~= "" then
                        vim.api.nvim_win_close(win, false);
                        print('Closing window', win)
                    end
                end
              end, desc = "Kill all floating windows" },
    { "<leader>wh", "<C-w>h", desc = "Horizontal Split" },
    { "<leader>wj", "<C-w>j", desc = "Horizontal Split" },
    { "<leader>wk", "<C-w>k", desc = "Horizontal Split" },
    { "<leader>wl", "<C-w>l", desc = "Horizontal Split" },
    { "<leader>ws", "<cmd>split<cr>", desc = "Horizontal Split" },
    { "<leader>wv", "<cmd>vsplit<cr>", desc = "Vertical Split" },
    { "<leader>ä", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain" },
  }, { mode = "n", prefix = "<leader>" })

-- Visual mode keymappings
wk.add({
    {
      mode = { "v" },
      { "<leader>c", group = "Code" },
      { "<leader>cb", desc = "Comment Lines as Block" },
      { "<leader>cf", "<cmd>'<,'>Format<cr>", desc = "Format range" },
      { "<leader>cl", desc = "Comment Lines" },
      { "<leader>j", group = "Substitute" },
      { "<leader>js", "<cmd>require('substitute.range').visual<cr>", desc = "Substitute selection within <range>" },
    },
  }, { mode = "v", prefix = "<leader>" })
