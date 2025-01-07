"Disable vi compatibility
set nocompatible

" ENCODINGS
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" TABS AND INDENT
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
filetype plugin indent on

" VISUALS
syntax on
set t_Co=256
colorscheme molokai
hi Comment ctermfg=102
hi Visual ctermbg=255
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
set showmode
set showcmd
set title
set number
set cursorline
set laststatus=2

" YANK
nnoremap Y y$

" SEARCH
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR>
set incsearch

" TAB COMPLETION
set wildmenu
set omnifunc=javascriptcomplete#CompleteJS

" FOLD
:set foldmethod=marker
:set foldcolumn=2

" FILES
set autoread
set nobackup
set noswapfile
set noundofile
set modifiable

" EMACS KEYBIND
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <END>

" INSERT YYYYMMDD
inoremap <F2> <C-R>=strftime("%y%m%d")<CR>

" WSL YANK SUPPORT https://github.com/Microsoft/WSL/issues/892#issuecomment-638886475
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
  augroup END
endif

" PLUGINGS
call plug#begin()
Plug 'chrisbra/csv.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
call plug#end()

" OVERRIDE LEADER KEY
let g:mapleader = "\<Space>"

" LIGHTLINE SETTINGS
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

" FZF SETTINGS
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

" EMMET SETTINGS
let g:user_emmet_leader_key = '<Tab>'
let g:user_emmet_settings = {
\  'html': {
\    'snippets': {
\      'html:5': '!!!+html>(head>(meta[charset=${charset}]+meta[name="viewport" content="width=device-width,initial-scale=1.0"]+meta[http-equiv="X-UA-Compatible" content="ie=edge"]+title +body'
    \}
 \}
\}

" NERDTREE SETTINGS
let g:NERDTreeShowHidden = 1
nnoremap <silent> <C-o> :NERDTreeToggle<CR>
