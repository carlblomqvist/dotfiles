" Auto install plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config//nvim/autoload/plug.vim --create-dirs
           \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    augroup PLUG
        au!
        autocmd VimEnter * PlugInstall
    augroup END
endif

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Auto completion for neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" UltiSnips snippets
Plug 'SirVer/ultisnips'

" A collection of language packs for vim
Plug 'sheerun/vim-polyglot'

" CameCase-motion
Plug 'bkad/CamelCaseMotion'
" Javascript
Plug 'ternjs/tern_for_vim'

" Java
Plug 'artur-shaik/vim-javacomplete2'

" Add git symbols to gutter
Plug 'airblade/vim-gitgutter'

" Get colorschemes from wal
Plug 'dylanaraps/wal.vim'

" Commenter plugin
Plug 'scrooloose/nerdcommenter'

Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'Twinside/vim-hoogle'
Plug 'joereynolds/place.vim'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'mhartington/oceanic-next'
Plug 'tomasiser/vim-code-dark'
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Initialize plugin system
call plug#end()

let mapleader = "\<Space>"

" Deoplete Settings
call deoplete#enable()
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
let g:deoplete#enable_at_startup = 1

" Deoplete Tab Completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"

" UltiSnips
"inoremap  <c-cr> <C-R>=UltiSnips#ExpandSnippetOrJump()<CR>
"xnoremap  <c-cr> :call UltiSnips#SaveLastVisualSelection()<CR>gvs
"snoremap  <c-cr> <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>

" Set default CamelCaseMotion bidnings
call camelcasemotion#CreateMotionMappings('<leader>')

" Use system clipboard
"set clipboard=unnamedplus

" Enable highlight search and smartcase
set hlsearch
set ignorecase
set smartcase

" Enable relative line numbers with absolute line on cursor
set relativenumber
set number

" Enable mouse support (scrolling, selection)
set mouse=a

" Enable syntax and use theme
syntax on
colorscheme wal

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=4
" when indenting with '>', use 2 spaces width
set shiftwidth=4
" On pressing tab, insert 2 spaces
set expandtab


" Tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" Neomake linting
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_haskell_enabled_makers = ['hlint']
let g:neomake_java_enable_makers = ['javac']
let g:neomake_c_enable_makers = ['gcc']
" Lint on save
autocmd! BufWritePost,BufEnter * Neomake

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
imap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)

nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
imap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)

" CtrlP Settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_working_path_mode = 0

" Quickly open/reload vim
nnoremap <leader>ev :split $MYVIMRC<CR>  
nnoremap <leader>sv :source $MYVIMRC<CR>  

" Open file explorer
nnoremap <leader>ee :Vexplore<CR>  

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Unbind the cursor keys in normal and visual modes.
for prefix in ['n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor
" Easymotion config
nmap <leader><leader><S-s> <Plug>(easymotion-s2)
" nmap <leader><leader><S-t> <Plug>(easymotion-t2)

" Make new lines without comments
nnoremap <leader>o o<Esc>^Da
nnoremap <leader>O O<Esc>^Da

" place.vim keybinds
nmap ga <Plug>(place-insert)
nmap gb <Plug>(place-insert-multiple)

" Clipboard
" +clipboard +xterm_clipboard +X11

let g:python3_host_prog = '/usr/bin/python3'

" Compile Java in vim
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return> :sleep 1<Return> :copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>
map <F12> :!javac %:p<Return> :!java %:r<Return>

" Save files with root privliges.
cmap w!! w !sudo tee % >/dev/null

" Show invisible characters.
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
