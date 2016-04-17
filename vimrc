" EJ's Vim Configuration "

" General Configuration
set nocompatible
set backspace=2    " Backspace deletes like most programs in insert mode
set laststatus=2   " Always display the status line
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set relativenumber " Sets relative number lines
set autowrite      " Automatically :write before running commands
set incsearch      " Highlight as you search
set autoindent     " Auto-indent
set nowrap         " Don't wrap text

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Show a column after 80 characters
set textwidth=80
set colorcolumn=+1

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  colorscheme slate
  syntax on
endif

" Softtabs, 2 spaces
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Remaps up arrow key to move current line of text up
no <Up> ddkP
" Remaps down arrow key to move current line of text down
no <Down> ddp


" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

