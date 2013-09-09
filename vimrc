execute pathogen#infect()
syntax on
filetype on
filetype plugin indent on

set number " Show line numbers
set title " show title in title bar

" Editing
set cursorline
set ruler
set nostartofline " Don't jump to BOL when moving around
set nowrap
set linebreak
set autoindent
set smartindent
set tabstop=4 " Tab is 4 spaces
set shiftwidth=4 " Indent level 2 spaces
set softtabstop=4 " <BS> over autoindent deletes both spaces
set expandtab " Use spaces instead of tabs
set shiftround " Rounds indent to a multiple of shiftwidth
set matchpairs+=<:> " show matching <> for html

" Code folding
" hotkey: za
set foldmethod=indent
set foldlevel=99

" Vim window management
" Vertical Split : Ctrl+w + v
" Horizontal Split : Ctrl+w + s
" Close current window
noremap <c-q> <c-w>q
" Move around windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" Make these work in insert mode
imap <C-W> <C-O><C-W>


" Tab navigation

" Open Nerdtree
map <C-n> :NERDTreeToggle<CR>
