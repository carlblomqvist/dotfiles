-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/eaclobr/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/eaclobr/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/eaclobr/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/eaclobr/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/eaclobr/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nh\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\3\rextended\1\nbasic\2\nextra\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["NeoZoom.lua"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/NeoZoom.lua",
    url = "https://github.com/nyngwang/NeoZoom.lua"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\tmode\fbuffers\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cellular-automaton.nvim"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/cellular-automaton.nvim",
    url = "https://github.com/eandrju/cellular-automaton.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["ctrlp.vim"] = {
    config = { "\27LJ\2\n3\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\22ctrlp_show_hidden\6g\bvim\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/ctrlp.vim",
    url = "https://github.com/ctrlpvim/ctrlp.vim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nÙ\1\0\0\6\1\a\0\18-\0\0\0009\0\0\0B\0\1\2\a\0\1\0X\0\2Ä+\0\0\0L\0\2\0005\0\2\0005\1\3\0-\2\0\0009\2\4\2-\4\0\0009\4\5\4B\4\1\0A\2\0\2>\2\3\1=\1\6\0L\0\2\0\0¿\targs!get_current_buffer_file_path\16escape_path\1\6\0\0 --search-parent-directories\21--stdin-filepath\0\a--\6-\1\0\2\bexe\vstylua\nstdin\2\16special.lua!get_current_buffer_file_name…\1\0\0\5\0\n\1\0165\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0006\1\2\0009\1\6\0019\1\a\1'\3\b\0B\1\2\2=\1\t\0L\0\2\0\bcwd\"/workspace/git/eaclobr/epg/up\vexpand\afn\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\22--assume-filename\1\0\2\bexe\17clang-format\nstdin\2\5ÄÄ¿ô\4ÿ\2\1\0\t\0\21\0&6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0006\4\5\0009\4\6\0049\4\a\0049\4\b\4=\4\t\0035\4\r\0004\5\3\0006\6\0\0'\b\n\0B\6\2\0029\6\v\6>\6\1\0053\6\f\0>\6\2\5=\5\14\0044\5\3\0003\6\15\0>\6\1\5=\5\16\0044\5\3\0006\6\0\0'\b\17\0B\6\2\0029\6\18\6>\6\1\5=\5\19\4=\4\20\3B\1\2\0012\0\0ÄK\0\1\0\rfiletype\6*\31remove_trailing_whitespace\28formatter.filetypes.any\6c\0\blua\1\0\0\0\vstylua\28formatter.filetypes.lua\14log_level\tWARN\vlevels\blog\bvim\1\0\1\flogging\1\nsetup\14formatter\19formatter.util\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  fzf = {
    config = { "\27LJ\2\nè\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0^            let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }\n            \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["fzfx.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tfzfx\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/fzfx.nvim",
    url = "https://github.com/linrongbin16/fzfx.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\15debug_mode\1\ftrouble\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hydra.nvim"] = {
    config = { "\27LJ\2\nÁ\1\0\0\a\0\n\0\0216\0\0\0'\2\1\0B\0\2\2\18\1\0\0005\3\2\0004\4\5\0005\5\3\0>\5\1\0045\5\4\0005\6\5\0>\6\3\5>\5\2\0045\5\6\0>\5\3\0045\5\a\0005\6\b\0>\6\3\5>\5\4\4=\4\t\3B\1\2\1K\0\1\0\nheads\1\0\1\tdesc\24half screen ‚Üê/‚Üí\1\3\0\0\6>\6>\1\3\0\0\6<\6<\1\0\1\tdesc\f‚Üê/‚Üí\1\3\0\0\6-\6-\1\3\0\0\6+\6+\1\0\3\tmode\6n\tbody\16<leader>hhw\tname\16Side scroll\nhydra\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/hydra.nvim",
    url = "https://github.com/anuvyklack/hydra.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["live-command.nvim"] = {
    config = { "\27LJ\2\nî\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\2B\0\2\1K\0\1\0\rcommands\1\0\0\6G\1\0\1\bcmd\6g\6D\1\0\1\bcmd\6d\tNorm\1\0\0\1\0\1\bcmd\tnorm\nsetup\17live-command\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/live-command.nvim",
    url = "https://github.com/smjonas/live-command.nvim"
  },
  ["local-highlight.nvim"] = {
    config = { "\27LJ\2\nÇ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15file_types\1\0\1\fhlgroup\22TSDefinitionUsage\1\4\0\0\6c\vpython\bcpp\nsetup\20local-highlight\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/local-highlight.nvim",
    url = "https://github.com/tzachar/local-highlight.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nµ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vbeacon\1\0\2\venable\2\14frequency\3\30\14lightbulb\1\0\0\1\0\5\venable\1\18sign_priority\3(\tsign\2\21enable_in_insert\1\17virtual_text\2\nsetup\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nö\4\0\0\a\0\28\00006\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\20\0004\4\0\0=\4\b\0034\4\0\0=\4\n\0034\4\3\0005\5\21\0005\6\22\0=\6\23\5>\5\1\4=\4\f\0034\4\3\0005\5\24\0005\6\25\0=\6\23\5>\5\1\4=\4\14\0034\4\0\0=\4\16\0034\4\0\0=\4\18\3=\3\26\2B\0\2\0016\0\0\0'\2\27\0B\0\2\1K\0\1\0\17evil_lualine\22inactive_sections\1\0\1\afg\f#FFFFFF\1\2\0\0\rlocation\ncolor\1\0\1\afg\f#FFFFFF\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\2\ntheme\fonedark\17globalstatus\1\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\nã\b\0\0\n\0,\0^6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\1\2\0005\3\r\0005\4\a\0009\5\4\0009\5\5\0055\a\6\0B\5\2\2=\5\b\0049\5\t\0009\5\n\0055\a\v\0B\5\2\2=\5\f\4=\4\14\0035\4\16\0009\5\4\0009\5\5\0055\a\15\0B\5\2\2=\5\b\0049\5\t\0009\5\n\0055\a\17\0B\5\2\2=\5\f\4=\4\18\3B\1\2\0016\1\0\0'\3\19\0B\1\2\0029\2\2\0015\4\31\0005\5\21\0005\6\20\0=\6\22\0055\6\23\0=\6\24\0055\6\25\0=\6\26\0055\6\27\0=\6\28\0059\6\29\0019\6\30\6B\6\1\2=\6\30\5=\5 \4B\2\2\0016\2\0\0'\4!\0B\2\2\0029\3\2\0025\5&\0005\6$\0009\a\"\0029\a\5\a5\t#\0B\a\2\2=\a%\6=\6'\5B\3\2\0016\3\0\0'\5(\0B\3\2\0029\3\2\0034\5\0\0B\3\2\0016\3\0\0'\5)\0B\3\2\0029\3\2\0034\5\0\0B\3\2\0016\3\0\0'\5*\0B\3\2\0029\3\2\0034\5\0\0B\3\2\0016\3\0\0'\5+\0B\3\2\0029\3\2\0034\5\0\0B\3\2\1K\0\1\0\17mini.tabline\19mini.splitjoin\19mini.operators\14mini.move\tdraw\1\0\0\14animation\1\0\0\1\0\2\rduration\3d\tunit\ntotal\18gen_animation\21mini.indentscope\17highlighters\1\0\0\14hex_color\20gen_highlighter\tnote\1\0\2\fpattern\25%f[%w]()NOTE()%f[%W]\ngroup\23MiniHipatternsNote\ttodo\1\0\2\fpattern\25%f[%w]()TODO()%f[%W]\ngroup\23MiniHipatternsTodo\thack\1\0\2\fpattern\25%f[%w]()HACK()%f[%W]\ngroup\23MiniHipatternsHack\nfixme\1\0\0\1\0\2\fpattern\26%f[%w]()FIXME()%f[%W]\ngroup\24MiniHipatternsFixme\20mini.hipatterns\vcursor\1\0\1\21max_output_steps\0032\1\0\0\1\0\2\rduration\3d\tunit\ntotal\vscroll\1\0\0\14subscroll\1\0\1\21max_output_steps\0032\nequal\18gen_subscroll\vtiming\1\0\0\1\0\2\rduration\3d\tunit\ntotal\vlinear\15gen_timing\17mini.animate\nsetup\15mini.align\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  neogen = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["neovim-session-manager"] = {
    config = { "\27LJ\2\nª\3\0\0\n\0\18\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0\18\6\0\0009\4\4\0006\a\5\0009\a\6\a9\a\a\a'\t\b\0B\a\2\2'\b\t\0B\4\4\2=\4\v\0036\4\0\0'\6\f\0B\4\2\0029\4\r\0049\4\14\4=\4\15\0035\4\16\0=\4\17\3B\1\2\1K\0\1\0\30autosave_ignore_filetypes\1\2\0\0\14gitcommit\18autoload_mode\16LastSession\17AutoloadMode\27session_manager.config\17sessions_dir\1\0\6\19colon_replacer\a++\31autosave_ignore_not_normal\2\26autosave_last_session\2\18path_replacer\a__\20max_path_length\3P\29autosave_only_in_session\1\rsessions\tdata\fstdpath\afn\bvim\bnew\nsetup\20session_manager\17plenary.path\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nlua.nvim",
    url = "https://github.com/tjdevries/nlua.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÎ\2\0\0\n\0\22\0.6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\17\0009\4\3\0009\4\4\0049\4\5\0045\6\a\0009\a\3\0009\a\6\a)\t¸ˇB\a\2\2=\a\b\0069\a\3\0009\a\6\a)\t\4\0B\a\2\2=\a\t\0069\a\3\0009\a\n\aB\a\1\2=\a\v\0069\a\3\0009\a\f\aB\a\1\2=\a\r\0069\a\3\0009\a\14\a5\t\15\0B\a\2\2=\a\16\6B\4\2\2=\4\3\0039\4\18\0009\4\19\0044\6\3\0005\a\20\0>\a\1\0064\a\3\0005\b\21\0>\b\1\aB\4\3\2=\4\19\3B\1\2\1K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\1\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navbuddy"] = {
    config = { "\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\blsp\1\0\0\1\0\1\16auto_attach\2\nsetup\18nvim-navbuddy\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nvim-navbuddy",
    url = "https://github.com/SmiteshP/nvim-navbuddy"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nô\3\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\fmatchup\1\0\2\venable\2\24include_match_words\1\14highlight\fdisable\1\4\0\0\trust\bzig\fhaskell\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\1\2\0\0\15javascript\21ensure_installed\1\0\0\1\20\0\0\6c\bcpp\blua\tbash\ncmake\fcomment\15dockerfile\fhaskell\tjson\tmake\rmarkdown\20markdown_inline\bnix\borg\vpython\trust\tyaml\tyang\bzig\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  orgmode = {
    config = { "\27LJ\2\n¨\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\21setup_ts_grammar\21org_agenda_files\1\0\1\27org_default_notes_file\19~/org/todo.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  pretty_hover = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17pretty_hover\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/pretty_hover",
    url = "https://github.com/Fildo7525/pretty_hover"
  },
  ["printer.nvim"] = {
    config = { "\27LJ\2\np\0\2\a\0\3\0\0066\2\0\0009\2\1\2'\4\2\0\18\5\0\0\18\6\1\0D\2\4\0Glogger_log(LOG_INFO, \"[%%s:%%s] %s: %%s\", __func__, __LINE__, %s);\vformat\vstring,\0\1\5\0\3\0\0056\1\0\0009\1\1\1'\3\2\0\18\4\0\0D\1\3\0\a%s\vformat\vstringî\1\1\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0003\4\4\0=\4\6\3=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\18add_to_inside\0\15formatters\6c\1\0\0\0\1\0\2\rbehavior\17insert_below\vkeymap\agp\nsetup\fprinter\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/printer.nvim",
    url = "https://github.com/rareitems/printer.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\nß\2\0\0\4\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\0016\0\0\0'\2\t\0B\0\2\0029\0\n\0'\2\v\0B\0\2\1K\0\1\0\rprojects\19load_extension\14telescope\17exclude_dirs\rpatterns\1\b\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\22detection_methods\1\0\2\17silent_chdir\1\16show_hidden\1\1\5\0\0\r>sources\b>up\blsp\fpattern\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["rose-pine"] = {
    config = { "\27LJ\2\ne\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\nsetup\14rose-pine\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["smartcolumn.nvim"] = {
    config = { "\27LJ\2\n®\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\0\0=\3\6\2B\0\2\1K\0\1\0\23custom_colorcolumn\23disabled_filetypes\1\4\0\0\thelp\ttext\rmarkdown\1\0\2\16colorcolumn\b121\nscope\tfile\nsetup\16smartcolumn\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/smartcolumn.nvim",
    url = "https://github.com/m4xshen/smartcolumn.nvim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\n•\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\vignore\1\0\0\fbuftype\1\4\0\0\rterminal\rquickfix\floclist\rfiletype\1\0\0\1\4\0\0\thelp\tlist\fTrouble\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["substitute.nvim"] = {
    config = { "\27LJ\2\n–\5\0\0\a\0 \0S6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\16\0'\3\a\0'\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0006\4\0\0'\6\20\0B\4\2\0029\4\21\0045\5\22\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\23\0006\4\0\0'\6\20\0B\4\2\0029\4\24\0045\5\25\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\16\0'\3\26\0006\4\0\0'\6\20\0B\4\2\0029\4\27\0045\5\28\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\29\0006\4\0\0'\6\20\0B\4\2\0029\4\30\0045\5\31\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\vcancel\bsxc\1\0\1\fnoremap\2\vvisual\6X\1\0\1\fnoremap\2\tline\bsxx\1\0\1\fnoremap\2\roperator\24substitute.exchange\asx\1\0\1\fnoremap\0020<cmd>lua require('substitute').visual()<cr>\6x\1\0\1\fnoremap\2-<cmd>lua require('substitute').eol()<cr>\6S\1\0\1\fnoremap\2.<cmd>lua require('substitute').line()<cr>\ass\1\0\1\fnoremap\0022<cmd>lua require('substitute').operator()<cr>\6s\6n\bset\vkeymap\bvim\nsetup\15substitute\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/substitute.nvim",
    url = "https://github.com/gbprod/substitute.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\n’\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-menufacture"] = {
    config = { "\27LJ\2\n“\1\0\0\t\0\14\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0005\2\f\0005\3\v\0005\4\t\0005\5\a\0004\6\0\b5\a\5\0'\b\6\0<\b\a\6=\6\b\5=\5\n\4=\4\3\3=\3\r\2B\0\2\1K\0\1\0\15extensions\1\0\0\1\0\0\rmappings\1\0\0\14main_menu\1\0\0\n<C-s>\1\3\0\0\6i\6n\nsetup\16menufacture\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/telescope-menufacture",
    url = "https://github.com/molecule-man/telescope-menufacture"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hidden\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hiddenƒ\3\1\0\6\0!\0-'\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\n\0005\5\t\0=\5\v\0043\5\f\0=\5\r\4=\4\14\0035\4\16\0003\5\15\0=\5\r\4=\4\17\0035\4\20\0005\5\18\0=\0\19\5=\5\21\0045\5\22\0=\0\19\5=\5\23\0045\5\24\0=\0\19\5=\5\17\0045\5\25\0=\0\19\5=\5\14\0045\5\26\0=\0\19\5=\5\27\0045\5\28\0=\0\19\5=\5\29\0045\5\30\0=\0\19\5=\5\31\4=\4 \3B\1\2\1K\0\1\0\fpickers\rprojects\1\0\0\16grep_string\1\0\0\30current_buffer_fuzzy_find\1\0\0\1\0\0\1\0\0\fbuffers\1\0\0\17file_browser\1\0\0\ntheme\1\0\0\14live_grep\1\0\0\0\15find_files\20additional_args\0\17find_command\1\0\0\1\4\0\0\afd\a-E\tepg/\rdefaults\1\0\0\25file_ignore_patterns\1\0\0\1\3\0\0\16**NAMESPACE\n^.git\nsetup\14telescope\frequire\bivy\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\nd\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0\29strip_whitespace_on_save\30better_whitespace_enabled\6g\bvim\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-endwise",
    url = "https://github.com/tpope/vim-endwise"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-matchup"] = {
    after_files = { "/home/eaclobr/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-mustache-handlebars"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-mustache-handlebars",
    url = "https://github.com/mustache/vim-mustache-handlebars"
  },
  ["vim-oscyank"] = {
    config = { "\27LJ\2\n≠\1\0\0\3\0\v\0\0246\0\0\0009\0\1\0009\0\2\0009\0\3\0\a\0\4\0X\0\6Ä6\0\0\0009\0\1\0009\0\2\0009\0\5\0\6\0\6\0X\0\6Ä6\0\0\0009\0\1\0009\0\2\0009\0\5\0\a\0\a\0X\0\5Ä6\0\0\0009\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0\23OSCYankRegister +\"\17nvim_command\bapi\6+\5\fregname\6y\roperator\nevent\6v\bvimq\1\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\2\18\1\0\0'\3\2\0'\4\3\0003\5\4\0B\1\4\0016\1\5\0009\1\6\1+\2\2\0=\2\a\1K\0\1\0\19oscyank_silent\6g\bvim\0\6*\17TextYankPost\rautofunc\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-oscyank",
    url = "https://github.com/ojroques/vim-oscyank"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tomorrow-theme"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-tomorrow-theme",
    url = "https://github.com/chriskempson/vim-tomorrow-theme"
  },
  ["vim-yankstack"] = {
    config = { "\27LJ\2\np\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\27call yankstack#setup()\17nvim_command\bapi\23yankstack_map_keys\6g\bvim\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-yankstack",
    url = "https://github.com/maxbrunsfeld/vim-yankstack"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\2\n’\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nsetup\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: neovim-session-manager
time([[Config for neovim-session-manager]], true)
try_loadstring("\27LJ\2\nª\3\0\0\n\0\18\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0\18\6\0\0009\4\4\0006\a\5\0009\a\6\a9\a\a\a'\t\b\0B\a\2\2'\b\t\0B\4\4\2=\4\v\0036\4\0\0'\6\f\0B\4\2\0029\4\r\0049\4\14\4=\4\15\0035\4\16\0=\4\17\3B\1\2\1K\0\1\0\30autosave_ignore_filetypes\1\2\0\0\14gitcommit\18autoload_mode\16LastSession\17AutoloadMode\27session_manager.config\17sessions_dir\1\0\6\19colon_replacer\a++\31autosave_ignore_not_normal\2\26autosave_last_session\2\18path_replacer\a__\20max_path_length\3P\29autosave_only_in_session\1\rsessions\tdata\fstdpath\afn\bvim\bnew\nsetup\20session_manager\17plenary.path\frequire\0", "config", "neovim-session-manager")
time([[Config for neovim-session-manager]], false)
-- Config for: telescope-frecency.nvim
time([[Config for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")
time([[Config for telescope-frecency.nvim]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\nã\b\0\0\n\0,\0^6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\1\2\0005\3\r\0005\4\a\0009\5\4\0009\5\5\0055\a\6\0B\5\2\2=\5\b\0049\5\t\0009\5\n\0055\a\v\0B\5\2\2=\5\f\4=\4\14\0035\4\16\0009\5\4\0009\5\5\0055\a\15\0B\5\2\2=\5\b\0049\5\t\0009\5\n\0055\a\17\0B\5\2\2=\5\f\4=\4\18\3B\1\2\0016\1\0\0'\3\19\0B\1\2\0029\2\2\0015\4\31\0005\5\21\0005\6\20\0=\6\22\0055\6\23\0=\6\24\0055\6\25\0=\6\26\0055\6\27\0=\6\28\0059\6\29\0019\6\30\6B\6\1\2=\6\30\5=\5 \4B\2\2\0016\2\0\0'\4!\0B\2\2\0029\3\2\0025\5&\0005\6$\0009\a\"\0029\a\5\a5\t#\0B\a\2\2=\a%\6=\6'\5B\3\2\0016\3\0\0'\5(\0B\3\2\0029\3\2\0034\5\0\0B\3\2\0016\3\0\0'\5)\0B\3\2\0029\3\2\0034\5\0\0B\3\2\0016\3\0\0'\5*\0B\3\2\0029\3\2\0034\5\0\0B\3\2\0016\3\0\0'\5+\0B\3\2\0029\3\2\0034\5\0\0B\3\2\1K\0\1\0\17mini.tabline\19mini.splitjoin\19mini.operators\14mini.move\tdraw\1\0\0\14animation\1\0\0\1\0\2\rduration\3d\tunit\ntotal\18gen_animation\21mini.indentscope\17highlighters\1\0\0\14hex_color\20gen_highlighter\tnote\1\0\2\fpattern\25%f[%w]()NOTE()%f[%W]\ngroup\23MiniHipatternsNote\ttodo\1\0\2\fpattern\25%f[%w]()TODO()%f[%W]\ngroup\23MiniHipatternsTodo\thack\1\0\2\fpattern\25%f[%w]()HACK()%f[%W]\ngroup\23MiniHipatternsHack\nfixme\1\0\0\1\0\2\fpattern\26%f[%w]()FIXME()%f[%W]\ngroup\24MiniHipatternsFixme\20mini.hipatterns\vcursor\1\0\1\21max_output_steps\0032\1\0\0\1\0\2\rduration\3d\tunit\ntotal\vscroll\1\0\0\14subscroll\1\0\1\21max_output_steps\0032\nequal\18gen_subscroll\vtiming\1\0\0\1\0\2\rduration\3d\tunit\ntotal\vlinear\15gen_timing\17mini.animate\nsetup\15mini.align\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\tmode\fbuffers\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n•\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\vignore\1\0\0\fbuftype\1\4\0\0\rterminal\rquickfix\floclist\rfiletype\1\0\0\1\4\0\0\thelp\tlist\fTrouble\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: NeoZoom.lua
time([[Config for NeoZoom.lua]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "NeoZoom.lua")
time([[Config for NeoZoom.lua]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nµ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vbeacon\1\0\2\venable\2\14frequency\3\30\14lightbulb\1\0\0\1\0\5\venable\1\18sign_priority\3(\tsign\2\21enable_in_insert\1\17virtual_text\2\nsetup\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\3\rextended\1\nbasic\2\nextra\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: smartcolumn.nvim
time([[Config for smartcolumn.nvim]], true)
try_loadstring("\27LJ\2\n®\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\0\0=\3\6\2B\0\2\1K\0\1\0\23custom_colorcolumn\23disabled_filetypes\1\4\0\0\thelp\ttext\rmarkdown\1\0\2\16colorcolumn\b121\nscope\tfile\nsetup\16smartcolumn\frequire\0", "config", "smartcolumn.nvim")
time([[Config for smartcolumn.nvim]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
try_loadstring("\27LJ\2\n¨\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\21setup_ts_grammar\21org_agenda_files\1\0\1\27org_default_notes_file\19~/org/todo.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0", "config", "orgmode")
time([[Config for orgmode]], false)
-- Config for: live-command.nvim
time([[Config for live-command.nvim]], true)
try_loadstring("\27LJ\2\nî\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\2B\0\2\1K\0\1\0\rcommands\1\0\0\6G\1\0\1\bcmd\6g\6D\1\0\1\bcmd\6d\tNorm\1\0\0\1\0\1\bcmd\tnorm\nsetup\17live-command\frequire\0", "config", "live-command.nvim")
time([[Config for live-command.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nô\3\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\fmatchup\1\0\2\venable\2\24include_match_words\1\14highlight\fdisable\1\4\0\0\trust\bzig\fhaskell\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\1\2\0\0\15javascript\21ensure_installed\1\0\0\1\20\0\0\6c\bcpp\blua\tbash\ncmake\fcomment\15dockerfile\fhaskell\tjson\tmake\rmarkdown\20markdown_inline\bnix\borg\vpython\trust\tyaml\tyang\bzig\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\nß\2\0\0\4\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\0016\0\0\0'\2\t\0B\0\2\0029\0\n\0'\2\v\0B\0\2\1K\0\1\0\rprojects\19load_extension\14telescope\17exclude_dirs\rpatterns\1\b\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\22detection_methods\1\0\2\17silent_chdir\1\16show_hidden\1\1\5\0\0\r>sources\b>up\blsp\fpattern\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: printer.nvim
time([[Config for printer.nvim]], true)
try_loadstring("\27LJ\2\np\0\2\a\0\3\0\0066\2\0\0009\2\1\2'\4\2\0\18\5\0\0\18\6\1\0D\2\4\0Glogger_log(LOG_INFO, \"[%%s:%%s] %s: %%s\", __func__, __LINE__, %s);\vformat\vstring,\0\1\5\0\3\0\0056\1\0\0009\1\1\1'\3\2\0\18\4\0\0D\1\3\0\a%s\vformat\vstringî\1\1\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0003\4\4\0=\4\6\3=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\18add_to_inside\0\15formatters\6c\1\0\0\0\1\0\2\rbehavior\17insert_below\vkeymap\agp\nsetup\fprinter\frequire\0", "config", "printer.nvim")
time([[Config for printer.nvim]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
try_loadstring("\27LJ\2\ne\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\nsetup\14rose-pine\frequire\0", "config", "rose-pine")
time([[Config for rose-pine]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\15debug_mode\1\ftrouble\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: fzfx.nvim
time([[Config for fzfx.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tfzfx\frequire\0", "config", "fzfx.nvim")
time([[Config for fzfx.nvim]], false)
-- Config for: vim-yankstack
time([[Config for vim-yankstack]], true)
try_loadstring("\27LJ\2\np\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\27call yankstack#setup()\17nvim_command\bapi\23yankstack_map_keys\6g\bvim\0", "config", "vim-yankstack")
time([[Config for vim-yankstack]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nÙ\1\0\0\6\1\a\0\18-\0\0\0009\0\0\0B\0\1\2\a\0\1\0X\0\2Ä+\0\0\0L\0\2\0005\0\2\0005\1\3\0-\2\0\0009\2\4\2-\4\0\0009\4\5\4B\4\1\0A\2\0\2>\2\3\1=\1\6\0L\0\2\0\0¿\targs!get_current_buffer_file_path\16escape_path\1\6\0\0 --search-parent-directories\21--stdin-filepath\0\a--\6-\1\0\2\bexe\vstylua\nstdin\2\16special.lua!get_current_buffer_file_name…\1\0\0\5\0\n\1\0165\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0006\1\2\0009\1\6\0019\1\a\1'\3\b\0B\1\2\2=\1\t\0L\0\2\0\bcwd\"/workspace/git/eaclobr/epg/up\vexpand\afn\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\22--assume-filename\1\0\2\bexe\17clang-format\nstdin\2\5ÄÄ¿ô\4ÿ\2\1\0\t\0\21\0&6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0006\4\5\0009\4\6\0049\4\a\0049\4\b\4=\4\t\0035\4\r\0004\5\3\0006\6\0\0'\b\n\0B\6\2\0029\6\v\6>\6\1\0053\6\f\0>\6\2\5=\5\14\0044\5\3\0003\6\15\0>\6\1\5=\5\16\0044\5\3\0006\6\0\0'\b\17\0B\6\2\0029\6\18\6>\6\1\5=\5\19\4=\4\20\3B\1\2\0012\0\0ÄK\0\1\0\rfiletype\6*\31remove_trailing_whitespace\28formatter.filetypes.any\6c\0\blua\1\0\0\0\vstylua\28formatter.filetypes.lua\14log_level\tWARN\vlevels\blog\bvim\1\0\1\flogging\1\nsetup\14formatter\19formatter.util\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: fzf
time([[Config for fzf]], true)
try_loadstring("\27LJ\2\nè\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0^            let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }\n            \14nvim_exec\bapi\bvim\0", "config", "fzf")
time([[Config for fzf]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nö\4\0\0\a\0\28\00006\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\20\0004\4\0\0=\4\b\0034\4\0\0=\4\n\0034\4\3\0005\5\21\0005\6\22\0=\6\23\5>\5\1\4=\4\f\0034\4\3\0005\5\24\0005\6\25\0=\6\23\5>\5\1\4=\4\14\0034\4\0\0=\4\16\0034\4\0\0=\4\18\3=\3\26\2B\0\2\0016\0\0\0'\2\27\0B\0\2\1K\0\1\0\17evil_lualine\22inactive_sections\1\0\1\afg\f#FFFFFF\1\2\0\0\rlocation\ncolor\1\0\1\afg\f#FFFFFF\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\2\ntheme\fonedark\17globalstatus\1\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: ctrlp.vim
time([[Config for ctrlp.vim]], true)
try_loadstring("\27LJ\2\n3\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\22ctrlp_show_hidden\6g\bvim\0", "config", "ctrlp.vim")
time([[Config for ctrlp.vim]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
try_loadstring("\27LJ\2\nd\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0\29strip_whitespace_on_save\30better_whitespace_enabled\6g\bvim\0", "config", "vim-better-whitespace")
time([[Config for vim-better-whitespace]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nÎ\2\0\0\n\0\22\0.6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\17\0009\4\3\0009\4\4\0049\4\5\0045\6\a\0009\a\3\0009\a\6\a)\t¸ˇB\a\2\2=\a\b\0069\a\3\0009\a\6\a)\t\4\0B\a\2\2=\a\t\0069\a\3\0009\a\n\aB\a\1\2=\a\v\0069\a\3\0009\a\f\aB\a\1\2=\a\r\0069\a\3\0009\a\14\a5\t\15\0B\a\2\2=\a\16\6B\4\2\2=\4\3\0039\4\18\0009\4\19\0044\6\3\0005\a\20\0>\a\1\0064\a\3\0005\b\21\0>\b\1\aB\4\3\2=\4\19\3B\1\2\1K\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\1\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: vim-oscyank
time([[Config for vim-oscyank]], true)
try_loadstring("\27LJ\2\n≠\1\0\0\3\0\v\0\0246\0\0\0009\0\1\0009\0\2\0009\0\3\0\a\0\4\0X\0\6Ä6\0\0\0009\0\1\0009\0\2\0009\0\5\0\6\0\6\0X\0\6Ä6\0\0\0009\0\1\0009\0\2\0009\0\5\0\a\0\a\0X\0\5Ä6\0\0\0009\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0\23OSCYankRegister +\"\17nvim_command\bapi\6+\5\fregname\6y\roperator\nevent\6v\bvimq\1\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\2\18\1\0\0'\3\2\0'\4\3\0003\5\4\0B\1\4\0016\1\5\0009\1\6\1+\2\2\0=\2\a\1K\0\1\0\19oscyank_silent\6g\bvim\0\6*\17TextYankPost\rautofunc\frequire\0", "config", "vim-oscyank")
time([[Config for vim-oscyank]], false)
-- Config for: hydra.nvim
time([[Config for hydra.nvim]], true)
try_loadstring("\27LJ\2\nÁ\1\0\0\a\0\n\0\0216\0\0\0'\2\1\0B\0\2\2\18\1\0\0005\3\2\0004\4\5\0005\5\3\0>\5\1\0045\5\4\0005\6\5\0>\6\3\5>\5\2\0045\5\6\0>\5\3\0045\5\a\0005\6\b\0>\6\3\5>\5\4\4=\4\t\3B\1\2\1K\0\1\0\nheads\1\0\1\tdesc\24half screen ‚Üê/‚Üí\1\3\0\0\6>\6>\1\3\0\0\6<\6<\1\0\1\tdesc\f‚Üê/‚Üí\1\3\0\0\6-\6-\1\3\0\0\6+\6+\1\0\3\tmode\6n\tbody\16<leader>hhw\tname\16Side scroll\nhydra\frequire\0", "config", "hydra.nvim")
time([[Config for hydra.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-navbuddy
time([[Config for nvim-navbuddy]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\blsp\1\0\0\1\0\1\16auto_attach\2\nsetup\18nvim-navbuddy\frequire\0", "config", "nvim-navbuddy")
time([[Config for nvim-navbuddy]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hidden\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hiddenƒ\3\1\0\6\0!\0-'\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\n\0005\5\t\0=\5\v\0043\5\f\0=\5\r\4=\4\14\0035\4\16\0003\5\15\0=\5\r\4=\4\17\0035\4\20\0005\5\18\0=\0\19\5=\5\21\0045\5\22\0=\0\19\5=\5\23\0045\5\24\0=\0\19\5=\5\17\0045\5\25\0=\0\19\5=\5\14\0045\5\26\0=\0\19\5=\5\27\0045\5\28\0=\0\19\5=\5\29\0045\5\30\0=\0\19\5=\5\31\4=\4 \3B\1\2\1K\0\1\0\fpickers\rprojects\1\0\0\16grep_string\1\0\0\30current_buffer_fuzzy_find\1\0\0\1\0\0\1\0\0\fbuffers\1\0\0\17file_browser\1\0\0\ntheme\1\0\0\14live_grep\1\0\0\0\15find_files\20additional_args\0\17find_command\1\0\0\1\4\0\0\afd\a-E\tepg/\rdefaults\1\0\0\25file_ignore_patterns\1\0\0\1\3\0\0\16**NAMESPACE\n^.git\nsetup\14telescope\frequire\bivy\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: pretty_hover
time([[Config for pretty_hover]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17pretty_hover\frequire\0", "config", "pretty_hover")
time([[Config for pretty_hover]], false)
-- Config for: telescope-menufacture
time([[Config for telescope-menufacture]], true)
try_loadstring("\27LJ\2\n“\1\0\0\t\0\14\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0005\2\f\0005\3\v\0005\4\t\0005\5\a\0004\6\0\b5\a\5\0'\b\6\0<\b\a\6=\6\b\5=\5\n\4=\4\3\3=\3\r\2B\0\2\1K\0\1\0\15extensions\1\0\0\1\0\0\rmappings\1\0\0\14main_menu\1\0\0\n<C-s>\1\3\0\0\6i\6n\nsetup\16menufacture\19load_extension\14telescope\frequire\0", "config", "telescope-menufacture")
time([[Config for telescope-menufacture]], false)
-- Config for: substitute.nvim
time([[Config for substitute.nvim]], true)
try_loadstring("\27LJ\2\n–\5\0\0\a\0 \0S6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\16\0'\3\a\0'\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0006\4\0\0'\6\20\0B\4\2\0029\4\21\0045\5\22\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\23\0006\4\0\0'\6\20\0B\4\2\0029\4\24\0045\5\25\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\16\0'\3\26\0006\4\0\0'\6\20\0B\4\2\0029\4\27\0045\5\28\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\29\0006\4\0\0'\6\20\0B\4\2\0029\4\30\0045\5\31\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\vcancel\bsxc\1\0\1\fnoremap\2\vvisual\6X\1\0\1\fnoremap\2\tline\bsxx\1\0\1\fnoremap\2\roperator\24substitute.exchange\asx\1\0\1\fnoremap\0020<cmd>lua require('substitute').visual()<cr>\6x\1\0\1\fnoremap\2-<cmd>lua require('substitute').eol()<cr>\6S\1\0\1\fnoremap\2.<cmd>lua require('substitute').line()<cr>\ass\1\0\1\fnoremap\0022<cmd>lua require('substitute').operator()<cr>\6s\6n\bset\vkeymap\bvim\nsetup\15substitute\frequire\0", "config", "substitute.nvim")
time([[Config for substitute.nvim]], false)
-- Config for: local-highlight.nvim
time([[Config for local-highlight.nvim]], true)
try_loadstring("\27LJ\2\nÇ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15file_types\1\0\1\fhlgroup\22TSDefinitionUsage\1\4\0\0\6c\vpython\bcpp\nsetup\20local-highlight\frequire\0", "config", "local-highlight.nvim")
time([[Config for local-highlight.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
