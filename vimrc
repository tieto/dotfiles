set encoding=utf-8

" Load pathogen managed plugins.
silent! call pathogen#infect()

runtime plugin/sensible.vim " So that we could override it..

" General.
set bs=indent,eol,start
set clipboard=unnamed
set completeopt=menu,menuone,preview
set dir=/var/tmp
set ffs=unix,dos,mac
set foldmethod=indent
set history=10000
set hlsearch
set ignorecase
set laststatus=2
set mouse=a
set nobackup
set nofoldenable
set noshowcmd
set relativenumber
set shiftround
set showtabline=2
set undodir=/var/tmp
set wildmenu
set wildmode=longest,full

" Indents.
set sw=2
set ts=2
set sts=2
set expandtab

" Autocmds.
au FileType c setlocal sw=4
au FileType c setlocal ts=4
au FileType c setlocal sts=4
au BufWritePre * :%s/\s\+$//e " Deletes all trailing whitespace after save.
au InsertLeave * :set nopaste

" When reading a file, jump to the last cursor position.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin indent on
syntax on
silent! colorscheme jellyx

" Goddamn colon shift.
cabbr Q quit
cabbr W write

" Tab/split maps.
map <Esc>h <C-w>h
map <Esc>j <C-w>j
map <Esc>k <C-w>k
map <Esc>l <C-w>l
map <Esc>q <C-w>s
map <Esc>w <C-w>v
map <Esc>a gT
map <Esc>s gt
map <Esc>z :q<CR>
map <Esc>Z :Bclose!<CR><Esc>z
map <Esc>t :tabnew<CR>

" Insert tiemstamps.
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

" Remove highlights with c-j
map <silent> <C-j> :noh<CR>
imap <silent> <C-j> <ESC>:noh<CR>i

" Leadermaps.
noremap <leader>s :%s/\s\+$//<CR> " remove trailing whitespace
inoremap <leader>p <C-o>:set paste<CR>
nnoremap <silent> \tr :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . > /dev/null 2>&1 &<CR>

" Switch lines.
nmap <silent> ek ddkP
nmap <silent> ej ddp

runtime functions.vim
runtime personal.vim " Weird settings should go here.
