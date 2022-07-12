-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
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
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n©\b\0\0\t\0\22\1&6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\3\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\0?\4\0\0=\3\5\0029\2\15\0019\2\16\2+\3\2\0=\3\17\0026\2\18\0009\2\19\2'\4\20\0B\2\2\0019\2\21\0009\4\15\1B\2\2\1K\0\1\0\nsetup)autocmd User AlphaReady echo 'ready'\bcmd\bvim\14noautocmd\topts\vconfig\f:qa<CR>\19Ôôô  Quit NVIM\6q :ene <BAR> startinsert <CR>\18ÔÖõ  New file\6e\vbutton\16top_buttons\1\v\0\0H                                             mm                    H                                             @@                    H                                                                   H*@@@@@@@@m    mm@*@@   m@@*@@m *@@*   *@@* *@@@  *@@@@@@@@m@@@@@m  H  @@    @@   m@*   @@ @@*   *@@  @@   m@     @@    @@    @@    @@  H  @!    @@   !@****** @@     @@   @@ m@      !@    !@    @@    @@  H  @!    !@   !@m    m @@     !@    !@@       !@    !@    !@    @@  H  !!    !!   !!****** !@     !!    !@!       !!    !!    !!    !!  H  !!    !!   :!!      !!!   !!!    !!!       !!    :!    :!    !!  H: :::  :!: :  : : ::   : : : :      :      : : : : :!:  :::   ::!: \bval\vheader\fsection\26alpha.themes.startify\nalpha\frequire\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
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
  chadtree = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/chadtree",
    url = "https://github.com/ms-jpq/chadtree"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  coq_nvim = {
    config = { "\27LJ\2\nØ\4\0\0\4\0\n\0\"6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\4\0+\3\2\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0+\3\2\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\6\0+\3\2\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0+\3\2\0B\0\3\0016\0\b\0'\2\t\0B\0\2\1K\0\1\0\bcoq\frequirexinoremap <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? \"\\<C-e><CR>\" : \"\\<C-y>\") : \"\\<CR>\"Ginoremap <silent><expr> <C-k>   pumvisible() ? \"\\<C-p>\" : \"\\<C-k>\"Ginoremap <silent><expr> <C-j>   pumvisible() ? \"\\<C-n>\" : \"\\<C-j>\"Iinoremap <silent><expr> <S-Tab> pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"Ginoremap <silent><expr> <Tab>   pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"\14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
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
    config = { "\27LJ\2\nÙ\1\0\0\6\1\a\0\18-\0\0\0009\0\0\0B\0\1\2\a\0\1\0X\0\2Ä+\0\0\0L\0\2\0005\0\2\0005\1\3\0-\2\0\0009\2\4\2-\4\0\0009\4\5\4B\4\1\0A\2\0\2>\2\3\1=\1\6\0L\0\2\0\0¿\targs!get_current_buffer_file_path\16escape_path\1\6\0\0 --search-parent-directories\21--stdin-filepath\0\a--\6-\1\0\2\nstdin\2\bexe\vstylua\16special.lua!get_current_buffer_file_nameÖ\3\1\0\t\0\22\0)6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0006\4\5\0009\4\6\0049\4\a\0049\4\b\4=\4\t\0035\4\r\0004\5\3\0006\6\0\0'\b\n\0B\6\2\0029\6\v\6>\6\1\0053\6\f\0>\6\2\5=\5\14\0044\5\3\0006\6\0\0'\b\15\0B\6\2\0029\6\16\6>\6\1\5=\5\17\0044\5\3\0006\6\0\0'\b\18\0B\6\2\0029\6\19\6>\6\1\5=\5\20\4=\4\21\3B\1\2\0012\0\0ÄK\0\1\0\rfiletype\6*\31remove_trailing_whitespace\28formatter.filetypes.any\6c\16clangformat\26formatter.filetypes.c\blua\1\0\0\0\vstylua\28formatter.filetypes.lua\14log_level\tWARN\vlevels\blog\bvim\1\0\1\flogging\1\nsetup\14formatter\19formatter.util\frequire\0" },
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
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\15debug_mode\1\ftrouble\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hydra.nvim"] = {
    config = { "\27LJ\2\nÁ\1\0\0\a\0\n\0\0216\0\0\0'\2\1\0B\0\2\2\18\1\0\0005\3\2\0004\4\5\0005\5\3\0>\5\1\0045\5\4\0005\6\5\0>\6\3\5>\5\2\0045\5\6\0>\5\3\0045\5\a\0005\6\b\0>\6\3\5>\5\4\4=\4\t\3B\1\2\1K\0\1\0\nheads\1\0\1\tdesc\24half screen ‚Üê/‚Üí\1\3\0\0\6>\6>\1\3\0\0\6<\6<\1\0\1\tdesc\f‚Üê/‚Üí\1\3\0\0\6-\6-\1\3\0\0\6+\6+\1\0\3\tbody\16<leader>hhw\tmode\6n\tname\16Side scroll\nhydra\frequire\0" },
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
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nv\0\0\4\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\1K\0\1\0\17evil_lualine\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neogen = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["neovim-session-manager"] = {
    config = { "\27LJ\2\nª\3\0\0\n\0\18\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0\18\6\0\0009\4\4\0006\a\5\0009\a\6\a9\a\a\a'\t\b\0B\a\2\2'\b\t\0B\4\4\2=\4\v\0036\4\0\0'\6\f\0B\4\2\0029\4\r\0049\4\14\4=\4\15\0035\4\16\0=\4\17\3B\1\2\1K\0\1\0\30autosave_ignore_filetypes\1\2\0\0\14gitcommit\18autoload_mode\16LastSession\17AutoloadMode\27session_manager.config\17sessions_dir\1\0\6\18path_replacer\a__\20max_path_length\3P\29autosave_only_in_session\1\31autosave_ignore_not_normal\2\26autosave_last_session\2\19colon_replacer\a++\rsessions\tdata\fstdpath\afn\bvim\bnew\nsetup\20session_manager\17plenary.path\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nlua.nvim",
    url = "https://github.com/tjdevries/nlua.nvim"
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
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nè\3\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\0035\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\fmatchup\1\0\2\24include_match_words\1\venable\2\14highlight&additional_vim_regex_highlighting\1\2\0\0\borg\fdisable\1\4\0\0\trust\bzig\fhaskell\1\0\1\venable\2\19ignore_install\1\2\0\0\15javascript\21ensure_installed\1\0\0\1\18\0\0\6c\bcpp\blua\tbash\ncmake\fcomment\15dockerfile\fhaskell\tjson\tmake\bnix\borg\vpython\trust\tyaml\tyang\bzig\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\n∏\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\tload\22toggle_style_list\1\6\0\0\vdarker\tdeep\twarm\vwarmer\nlight\1\0\2\21toggle_style_key\15<leader>ts\nstyle\twarm\nsetup\fonedark\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
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
  ["project.nvim"] = {
    config = { "\27LJ\2\nß\2\0\0\4\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\0016\0\0\0'\2\t\0B\0\2\0029\0\n\0'\2\v\0B\0\2\1K\0\1\0\rprojects\19load_extension\14telescope\17exclude_dirs\rpatterns\1\b\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\22detection_methods\1\0\2\17silent_chdir\1\16show_hidden\1\1\5\0\0\r>sources\b>up\blsp\fpattern\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["scope.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nscope\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/scope.nvim",
    url = "https://github.com/tiagovla/scope.nvim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\n•\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\vignore\1\0\0\fbuftype\1\4\0\0\rterminal\rquickfix\floclist\rfiletype\1\0\0\1\4\0\0\thelp\tlist\fTrouble\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["substitute.nvim"] = {
    config = { "\27LJ\2\n≥\3\0\0\6\0\19\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\16\0'\3\a\0'\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\1\fnoremap\0020<cmd>lua require('substitute').visual()<cr>\6x\1\0\1\fnoremap\2-<cmd>lua require('substitute').eol()<cr>\6S\1\0\1\fnoremap\2.<cmd>lua require('substitute').line()<cr>\ass\1\0\1\fnoremap\0022<cmd>lua require('substitute').operator()<cr>\6s\6n\bset\vkeymap\bvim\nsetup\15substitute\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/substitute.nvim",
    url = "https://github.com/gbprod/substitute.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\n’\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hidden\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hidden†\3\1\0\6\0\31\0+'\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\n\0003\5\t\0=\5\v\4=\4\f\0035\4\14\0003\5\r\0=\5\v\4=\4\15\0035\4\18\0005\5\16\0=\0\17\5=\5\19\0045\5\20\0=\0\17\5=\5\21\0045\5\22\0=\0\17\5=\5\15\0045\5\23\0=\0\17\5=\5\f\0045\5\24\0=\0\17\5=\5\25\0045\5\26\0=\0\17\5=\5\27\0045\5\28\0=\0\17\5=\5\29\4=\4\30\3B\1\2\1K\0\1\0\fpickers\rprojects\1\0\0\16grep_string\1\0\0\30current_buffer_fuzzy_find\1\0\0\1\0\0\1\0\0\fbuffers\1\0\0\17file_browser\1\0\0\ntheme\1\0\0\14live_grep\1\0\0\0\15find_files\20additional_args\1\0\0\0\rdefaults\1\0\0\25file_ignore_patterns\1\0\0\1\3\0\0\16**NAMESPACE\n^.git\nsetup\14telescope\frequire\bivy\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
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
    config = { "\27LJ\2\nß\1\0\0\3\0\v\0\0246\0\0\0009\0\1\0009\0\2\0009\0\3\0\a\0\4\0X\0\6Ä6\0\0\0009\0\1\0009\0\2\0009\0\5\0\6\0\6\0X\0\6Ä6\0\0\0009\0\1\0009\0\2\0009\0\5\0\a\0\a\0X\0\5Ä6\0\0\0009\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0\17OSCYankReg \"\17nvim_command\bapi\6+\5\fregname\6y\roperator\nevent\6v\bvimq\1\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\2\18\1\0\0'\3\2\0'\4\3\0003\5\4\0B\1\4\0016\1\5\0009\1\6\1+\2\2\0=\2\a\1K\0\1\0\19oscyank_silent\6g\bvim\0\6*\17TextYankPost\rautofunc\frequire\0" },
    loaded = true,
    path = "/home/eaclobr/.local/share/nvim/site/pack/packer/start/vim-oscyank",
    url = "https://github.com/ojroques/vim-oscyank"
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
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n•\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\vignore\1\0\0\fbuftype\1\4\0\0\rterminal\rquickfix\floclist\rfiletype\1\0\0\1\4\0\0\thelp\tlist\fTrouble\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: scope.nvim
time([[Config for scope.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nscope\frequire\0", "config", "scope.nvim")
time([[Config for scope.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\nß\2\0\0\4\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\0016\0\0\0'\2\t\0B\0\2\0029\0\n\0'\2\v\0B\0\2\1K\0\1\0\rprojects\19load_extension\14telescope\17exclude_dirs\rpatterns\1\b\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\22detection_methods\1\0\2\17silent_chdir\1\16show_hidden\1\1\5\0\0\r>sources\b>up\blsp\fpattern\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n∏\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\tload\22toggle_style_list\1\6\0\0\vdarker\tdeep\twarm\vwarmer\nlight\1\0\2\21toggle_style_key\15<leader>ts\nstyle\twarm\nsetup\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: neovim-session-manager
time([[Config for neovim-session-manager]], true)
try_loadstring("\27LJ\2\nª\3\0\0\n\0\18\0\0286\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0\18\6\0\0009\4\4\0006\a\5\0009\a\6\a9\a\a\a'\t\b\0B\a\2\2'\b\t\0B\4\4\2=\4\v\0036\4\0\0'\6\f\0B\4\2\0029\4\r\0049\4\14\4=\4\15\0035\4\16\0=\4\17\3B\1\2\1K\0\1\0\30autosave_ignore_filetypes\1\2\0\0\14gitcommit\18autoload_mode\16LastSession\17AutoloadMode\27session_manager.config\17sessions_dir\1\0\6\18path_replacer\a__\20max_path_length\3P\29autosave_only_in_session\1\31autosave_ignore_not_normal\2\26autosave_last_session\2\19colon_replacer\a++\rsessions\tdata\fstdpath\afn\bvim\bnew\nsetup\20session_manager\17plenary.path\frequire\0", "config", "neovim-session-manager")
time([[Config for neovim-session-manager]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nv\0\0\4\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\1K\0\1\0\17evil_lualine\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: vim-yankstack
time([[Config for vim-yankstack]], true)
try_loadstring("\27LJ\2\np\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\27call yankstack#setup()\17nvim_command\bapi\23yankstack_map_keys\6g\bvim\0", "config", "vim-yankstack")
time([[Config for vim-yankstack]], false)
-- Config for: hydra.nvim
time([[Config for hydra.nvim]], true)
try_loadstring("\27LJ\2\nÁ\1\0\0\a\0\n\0\0216\0\0\0'\2\1\0B\0\2\2\18\1\0\0005\3\2\0004\4\5\0005\5\3\0>\5\1\0045\5\4\0005\6\5\0>\6\3\5>\5\2\0045\5\6\0>\5\3\0045\5\a\0005\6\b\0>\6\3\5>\5\4\4=\4\t\3B\1\2\1K\0\1\0\nheads\1\0\1\tdesc\24half screen ‚Üê/‚Üí\1\3\0\0\6>\6>\1\3\0\0\6<\6<\1\0\1\tdesc\f‚Üê/‚Üí\1\3\0\0\6-\6-\1\3\0\0\6+\6+\1\0\3\tbody\16<leader>hhw\tmode\6n\tname\16Side scroll\nhydra\frequire\0", "config", "hydra.nvim")
time([[Config for hydra.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\15debug_mode\1\ftrouble\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: vim-oscyank
time([[Config for vim-oscyank]], true)
try_loadstring("\27LJ\2\nß\1\0\0\3\0\v\0\0246\0\0\0009\0\1\0009\0\2\0009\0\3\0\a\0\4\0X\0\6Ä6\0\0\0009\0\1\0009\0\2\0009\0\5\0\6\0\6\0X\0\6Ä6\0\0\0009\0\1\0009\0\2\0009\0\5\0\a\0\a\0X\0\5Ä6\0\0\0009\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0\17OSCYankReg \"\17nvim_command\bapi\6+\5\fregname\6y\roperator\nevent\6v\bvimq\1\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\2\18\1\0\0'\3\2\0'\4\3\0003\5\4\0B\1\4\0016\1\5\0009\1\6\1+\2\2\0=\2\a\1K\0\1\0\19oscyank_silent\6g\bvim\0\6*\17TextYankPost\rautofunc\frequire\0", "config", "vim-oscyank")
time([[Config for vim-oscyank]], false)
-- Config for: fzf
time([[Config for fzf]], true)
try_loadstring("\27LJ\2\nè\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0^            let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }\n            \14nvim_exec\bapi\bvim\0", "config", "fzf")
time([[Config for fzf]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nÙ\1\0\0\6\1\a\0\18-\0\0\0009\0\0\0B\0\1\2\a\0\1\0X\0\2Ä+\0\0\0L\0\2\0005\0\2\0005\1\3\0-\2\0\0009\2\4\2-\4\0\0009\4\5\4B\4\1\0A\2\0\2>\2\3\1=\1\6\0L\0\2\0\0¿\targs!get_current_buffer_file_path\16escape_path\1\6\0\0 --search-parent-directories\21--stdin-filepath\0\a--\6-\1\0\2\nstdin\2\bexe\vstylua\16special.lua!get_current_buffer_file_nameÖ\3\1\0\t\0\22\0)6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0006\4\5\0009\4\6\0049\4\a\0049\4\b\4=\4\t\0035\4\r\0004\5\3\0006\6\0\0'\b\n\0B\6\2\0029\6\v\6>\6\1\0053\6\f\0>\6\2\5=\5\14\0044\5\3\0006\6\0\0'\b\15\0B\6\2\0029\6\16\6>\6\1\5=\5\17\0044\5\3\0006\6\0\0'\b\18\0B\6\2\0029\6\19\6>\6\1\5=\5\20\4=\4\21\3B\1\2\0012\0\0ÄK\0\1\0\rfiletype\6*\31remove_trailing_whitespace\28formatter.filetypes.any\6c\16clangformat\26formatter.filetypes.c\blua\1\0\0\0\vstylua\28formatter.filetypes.lua\14log_level\tWARN\vlevels\blog\bvim\1\0\1\flogging\1\nsetup\14formatter\19formatter.util\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: ctrlp.vim
time([[Config for ctrlp.vim]], true)
try_loadstring("\27LJ\2\n3\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\22ctrlp_show_hidden\6g\bvim\0", "config", "ctrlp.vim")
time([[Config for ctrlp.vim]], false)
-- Config for: coq_nvim
time([[Config for coq_nvim]], true)
try_loadstring("\27LJ\2\nØ\4\0\0\4\0\n\0\"6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\4\0+\3\2\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0+\3\2\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\6\0+\3\2\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0+\3\2\0B\0\3\0016\0\b\0'\2\t\0B\0\2\1K\0\1\0\bcoq\frequirexinoremap <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? \"\\<C-e><CR>\" : \"\\<C-y>\") : \"\\<CR>\"Ginoremap <silent><expr> <C-k>   pumvisible() ? \"\\<C-p>\" : \"\\<C-k>\"Ginoremap <silent><expr> <C-j>   pumvisible() ? \"\\<C-n>\" : \"\\<C-j>\"Iinoremap <silent><expr> <S-Tab> pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"Ginoremap <silent><expr> <Tab>   pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"\14nvim_exec\bapi\bvim\0", "config", "coq_nvim")
time([[Config for coq_nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nè\3\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\0035\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\fmatchup\1\0\2\24include_match_words\1\venable\2\14highlight&additional_vim_regex_highlighting\1\2\0\0\borg\fdisable\1\4\0\0\trust\bzig\fhaskell\1\0\1\venable\2\19ignore_install\1\2\0\0\15javascript\21ensure_installed\1\0\0\1\18\0\0\6c\bcpp\blua\tbash\ncmake\fcomment\15dockerfile\fhaskell\tjson\tmake\bnix\borg\vpython\trust\tyaml\tyang\bzig\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: chadtree
time([[Config for chadtree]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "chadtree")
time([[Config for chadtree]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\tmode\fbuffers\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: NeoZoom.lua
time([[Config for NeoZoom.lua]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "NeoZoom.lua")
time([[Config for NeoZoom.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\3\rextended\1\nbasic\2\nextra\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
try_loadstring("\27LJ\2\nd\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0\29strip_whitespace_on_save\30better_whitespace_enabled\6g\bvim\0", "config", "vim-better-whitespace")
time([[Config for vim-better-whitespace]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hidden\28\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\2\0\0\r--hidden†\3\1\0\6\0\31\0+'\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\n\0003\5\t\0=\5\v\4=\4\f\0035\4\14\0003\5\r\0=\5\v\4=\4\15\0035\4\18\0005\5\16\0=\0\17\5=\5\19\0045\5\20\0=\0\17\5=\5\21\0045\5\22\0=\0\17\5=\5\15\0045\5\23\0=\0\17\5=\5\f\0045\5\24\0=\0\17\5=\5\25\0045\5\26\0=\0\17\5=\5\27\0045\5\28\0=\0\17\5=\5\29\4=\4\30\3B\1\2\1K\0\1\0\fpickers\rprojects\1\0\0\16grep_string\1\0\0\30current_buffer_fuzzy_find\1\0\0\1\0\0\1\0\0\fbuffers\1\0\0\17file_browser\1\0\0\ntheme\1\0\0\14live_grep\1\0\0\0\15find_files\20additional_args\1\0\0\0\rdefaults\1\0\0\25file_ignore_patterns\1\0\0\1\3\0\0\16**NAMESPACE\n^.git\nsetup\14telescope\frequire\bivy\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\2\n’\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\nsetup\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n©\b\0\0\t\0\22\1&6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\3\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\0?\4\0\0=\3\5\0029\2\15\0019\2\16\2+\3\2\0=\3\17\0026\2\18\0009\2\19\2'\4\20\0B\2\2\0019\2\21\0009\4\15\1B\2\2\1K\0\1\0\nsetup)autocmd User AlphaReady echo 'ready'\bcmd\bvim\14noautocmd\topts\vconfig\f:qa<CR>\19Ôôô  Quit NVIM\6q :ene <BAR> startinsert <CR>\18ÔÖõ  New file\6e\vbutton\16top_buttons\1\v\0\0H                                             mm                    H                                             @@                    H                                                                   H*@@@@@@@@m    mm@*@@   m@@*@@m *@@*   *@@* *@@@  *@@@@@@@@m@@@@@m  H  @@    @@   m@*   @@ @@*   *@@  @@   m@     @@    @@    @@    @@  H  @!    @@   !@****** @@     @@   @@ m@      !@    !@    @@    @@  H  @!    !@   !@m    m @@     !@    !@@       !@    !@    !@    @@  H  !!    !!   !!****** !@     !!    !@!       !!    !!    !!    !!  H  !!    !!   :!!      !!!   !!!    !!!       !!    :!    :!    !!  H: :::  :!: :  : : ::   : : : :      :      : : : : :!:  :::   ::!: \bval\vheader\fsection\26alpha.themes.startify\nalpha\frequire\5ÄÄ¿ô\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: substitute.nvim
time([[Config for substitute.nvim]], true)
try_loadstring("\27LJ\2\n≥\3\0\0\6\0\19\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\16\0'\3\a\0'\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\1\fnoremap\0020<cmd>lua require('substitute').visual()<cr>\6x\1\0\1\fnoremap\2-<cmd>lua require('substitute').eol()<cr>\6S\1\0\1\fnoremap\2.<cmd>lua require('substitute').line()<cr>\ass\1\0\1\fnoremap\0022<cmd>lua require('substitute').operator()<cr>\6s\6n\bset\vkeymap\bvim\nsetup\15substitute\frequire\0", "config", "substitute.nvim")
time([[Config for substitute.nvim]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
try_loadstring("\27LJ\2\n¨\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\21setup_ts_grammar\21org_agenda_files\1\0\1\27org_default_notes_file\19~/org/todo.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0", "config", "orgmode")
time([[Config for orgmode]], false)
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
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
