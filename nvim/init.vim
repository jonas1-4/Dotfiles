"""""""""""""""""""""""""""""""""""""""""

"Tabs
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
""asm
autocmd BufNewFile,Bufread *.s set ft=asm
autocmd FileType asm call AssemblyConfig() 

function AssemblyConfig()
  setlocal softtabstop=8
  setlocal tabstop=8
  setlocal noexpandtab
  retab
endfunction

"Code Folding
set foldmethod=syntax   
set foldnestmax=10
set nofoldenable
set foldlevel=2

augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

"Linenumbers
set relativenumber
set nu

"Gui stuff
set termguicolors
set nohlsearch
set incsearch
set nowrap
set colorcolumn=80
set cmdheight=2
set encoding=utf-8
set guifont=monospace:h15
let g:airline_powerline_fonts = 1
let g:neovide_fullscreen=v:true
let g:neovide_cursor_animation_length=0
let g:neovide_cursor_vfx_mode = "railgun"

"Practical Stuff
set hidden
set scrolloff=20
set updatetime=50
set exrc    "   Really cool feature should use it!!!
let mapleader = " "
set notimeout
set ttimeout

"History
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

call plug#begin('~/vim/plugged')

"Tools
Plug 'preservim/nerdcommenter'
Plug 'folke/which-key.nvim'
Plug 'Pocco81/AutoSave.nvim'

"Telescope + Harpoon
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'ThePrimeagen/harpoon'

"""Flutter + Dart
""Plug 'dart-lang/dart-vim-plugin'
""Plug 'thosakwe/vim-flutter'
""Plug 'natebosch/vim-lsc'
""Plug 'natebosch/vim-lsc-dart'
""Plug 'nvim-lua/plenary.nvim'
""Plug 'akinsho/flutter-tools.nvim'

"Lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-flutter']
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'

"Git
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

"Look
Plug 'gruvbox-community/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wfxr/minimap.vim'
Plug 'dylanaraps/wal.vim'
call plug#end()


syntax on
colorscheme onedark


nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR> 
nnoremap <leader>fs :wa <CR>
nnoremap <leader>fo :Ex! <CR>

"Angular"
function! NgCreateComponent(kind)
  call inputsave()
  let name = input('Name of Component:')
  cal inputrestore()
  execute ':!ng generate '.a:kind.' '.name
endfunction

nnoremap <leader>ccc :call NgCreateComponent('component')<CR>
nnoremap <leader>ccs :call NgCreateComponent('service')<CR>
nnoremap <leader>cck :call NgCreateComponent('class')<CR>

""Git 
function! Gitcommit()
  call inputsave()
  let name = input('Name of Component:')
  cal inputrestore()
  execute ':!gitcommit '.name
endfunction

nnoremap <leader>gc :call Gitcommit()<CR>
nnoremap <leader>gp :!gitmerge<CR>


vnoremap  <leader>y  "+y  <CR>
nnoremap  <leader>Y  "+yg_<CR>
nnoremap  <leader>y  "+y  <CR>
nnoremap  <leader>yy  "+yy<CR>

" " Paste from clipboard
nnoremap <leader>p "+p <CR>
nnoremap <leader>P "+P <CR>
vnoremap <leader>p "+p <CR>
vnoremap <leader>P "+P <CR>

"Auto Close brackets etc.
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"Buffer keymap"
nnoremap <c-x> :bd! <CR>
inoremap <c-x> :bd! <CR>
vnoremap <c-x> :bd! <CR>
tnoremap <Esc><c-x> :bd! <CR>

"Terminal"
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 6
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


""let g:airline#extensions#hunks#enabled=0
