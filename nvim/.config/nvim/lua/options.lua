Af = require('autofunc')
Bo = require('bufopt')
Tools = require('tools')

-->> window <<--

-- show file numbers
vim.wo.number = true
-- relative file numbers
vim.wo.relativenumber = true
vim.wo.nu = true
vim.wo.rnu = true
vim.wo.numberwidth = 3
vim.wo.statuscolumn = "%=%s%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''} "
vim.wo.signcolumn = "yes:1"
-- relative numbers in normal mode, absolute numbers in insert
Af('BufEnter,FocusGained,InsertLeave', '*', function()
    vim.wo.statuscolumn = "%=%s%{v:virtnum < 1 ? (v:relnum ? (v:relnum < 10 ? '  ' . v:relnum : v:relnum) : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''} "
                                            end)
Af('BufLeave,FocusLost,InsertEnter',   '*', function()
                                                vim.wo.statuscolumn = "%=%s%l "
                                            end)

-- Remove trailing whitespace on save
Af('BufWritePre', '*', Tools.removeTrailingWhitespace())

-- put numbers and signs in the same column
--vim.wo.signcolumn = 'number'

-->> editor <<--

-- set font in gui
if vim.o.guifont then
  vim.o.guifont = 'Fira Code'
end

-- split a new buffer to the right
vim.o.splitright = true
-- split new buffer to the bottom
vim.o.splitbelow = true
-- briefly jump to matching seperator
vim.o.showmatch = true
-- case insensitive search
vim.o.ignorecase = true
-- highlight searches
vim.o.hlsearch = true
-- copy-paste with system clipboard
vim.o.clipboard = 'unnamedplus'
-- background color for themes
--vim.o.background = 'dark'
-- we support termguicolors
vim.o.termguicolors = true
-- abandon buffer when unloading
vim.o.hidden = true
-- some language servers dont like backup files
vim.o.backup = false
vim.o.writebackup = false
-- more space for coc messages
vim.o.cmdheight = 3
-- more responsiveness
vim.o.updatetime = 300
-- avoid some prompts?
vim.o.shortmess = vim.o.shortmess .. 'c'
-- scrolling "bounding"
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-->> buffer options <<--
Bo.tabstop = 4
-- implicit tab size
Bo.softtabstop = 4
-- another kind of stabstop
Bo.shiftwidth = 4
-- convert tabs to spaces
Bo.expandtab = true
Bo.autoindent = true

-->> global options <<--
-- snappy vim
vim.g.updatetime = 100
-- default /g on :s//
vim.g.gdefault = true

-- set leader key to space
vim.g.mapleader = ' '
-- and also for the local buffer
-- because thats what `let` does...
vim.b.mapleader = ' '

-- set language to english
vim.cmd('language en_US.utf-8')
-- vim.v.lang = 'en_US'

-- enable syntax highlighting
vim.cmd('syntax on')

-- enable filetype detection
vim.cmd('filetype plugin indent on')

-- update plugins when saving plugins.lua
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])

-- Highlight when yanking
vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')
