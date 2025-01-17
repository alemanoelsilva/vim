## ~/.vimrc
- ":source ~/.vimrc" to apply changes
- ":PlugInstall" to install plugins

------ Config -------

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on
set re=0

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 2 spaces.
set shiftwidth=2

" Set tab width to 2 columns.
set tabstop=2

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=30

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.
call plug#begin('~/.vim/plugged')
  " lint
  Plug 'dense-analysis/ale'
  " source tree
  Plug 'preservim/nerdtree'
  " git
  Plug 'tpope/vim-fugitive'
  " terminal
  Plug 'voldikss/vim-floaterm'
  " typescript
  Plug 'leafgarland/typescript-vim'
  " lsp
  Plug 'prabirshrestha/vim-lsp'
  " Fuzzy Finder --> https://github.com/junegunn/fzf.vim?tab=readme-ov-file
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Lightline --> https://github.com/itchyny/lightline.vim
  Plug 'itchyny/lightline.vim'



call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{
" Leader Mapping
let mapleader = " "

" Go to Explorer
nnoremap qq :Explore<CR>

" NERDTree Mapping
nnoremap <C-n>n :NERDTree<CR>
nnoremap <C-n>t :NERDTreeToggle<CR>
nnoremap <C-n>f :NERDTreeFind<CR>

" Float terminal Mapping
nnoremap <C-t>n :FloatermNew<CR>
nnoremap <C-t>t :FloatermToggle<CR>

"Fuzzy Finder
nnoremap <C-f>f :Files<CR>


" Start NERDTree and leave the cursor in it.
@REM autocmd VimEnter * NERDTree
" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2
" }}}
