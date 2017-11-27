set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'jgdavey/tslime.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'sheerun/vim-polyglot'
Plugin 'tfnico/vim-gradle'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'digitaltoad/vim-jade'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'chriskempson/base16-vim'
Plugin 'mileszs/ack.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dkprice/vim-easygrep'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'b4winckler/vim-objc'
Plugin 'briancollins/vim-jst'
" Plugin 'goldfeld/vim-seek'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'epilande/vim-react-snippets'
Plugin 'justinmk/vim-sneak'

call vundle#end()

filetype on
filetype plugin indent on
syntax enable
highlight MatchParen ctermbg=4

" set nocursorcolumn
" set nocursorline
" set norelativenumber
" syntax sync minlines=256

let mapleader=","
set autoread
set encoding=utf-8
set showcmd
set showmode
set foldmethod=manual
set directory-=.
set wildmenu
set wildmode=list:longest,full
set mouse=a
set backspace=2
set number
set ruler
set ignorecase
set incsearch
set hlsearch
set nohidden
set clipboard=unnamed
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫

nnoremap ; :

set background=dark

set splitbelow
set splitright

" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn guibg=#efefef ctermbg=7

if version >= 700
   set spl=en spell
   set nospell
endif

set guifont=Monaco:h12

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
if has("autocmd")
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

  autocmd BufNewFile,BufRead *.rss set filetype=xml
  autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Remove any trailing whitespace that is in the file
  autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "kpdf"

" Key Mappings
:imap ;; <Esc>
noremap <silent> <space>l <C-w>l
noremap <silent> <space>h <C-w>h
noremap <silent> <C-k> <C-w>k
noremap <silent> <C-j> <C-w>j
noremap <silent> <C-t> :tabnew<CR>
noremap <silent> <C-h> :tabprevious<CR>
noremap <silent> <C-l> :tabnext<CR>
noremap <silent> <Leader>l :nohls<CR><ESC>
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>
nnoremap <silent> <Leader>gv :tabnew<CR>:e ~/.gvimrc<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

nnoremap <silent> <Home> i <Esc>r
nnoremap <silent> <End> a <Esc>r

nnoremap <silent> <Leader>o o<Esc>
nnoremap <silent> <Leader>O O<Esc>


nnoremap <silent> <Leader>c :noh

map N Nzz
map n nzz

map <D-1> :tabn 1 <CR>
map <D-2> :tabn 2 <CR>
map <D-3> :tabn 3 <CR>
map <D-4> :tabn 4 <CR>
map <D-5> :tabn 5 <CR>
map <D-6> :tabn 6 <CR>
map <D-7> :tabn 7 <CR>
map <D-8> :tabn 8 <CR>
map <D-9> :tabn 9 <CR>

nmap <Leader>n :nohlsearch<CR>

" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <D-J> :m .+1<CR>==
nnoremap <D-K> :m .-2<CR>==

nnoremap <Leader>W :update<CR> :bd<CR>

" Testing
set completeopt=longest,menuone,preview

" Reload .vimrc
nnoremap <silent> <Leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


" Plugins

" Set runtime path for ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <Leader>b :CtrlPBuffer<CR>

" let g:ctrlp_match_window = 'order:ttb,max:20'

nnoremap <Leader>e :Tabularize /=<CR>
nnoremap <Leader>f :Tabularize /\|<CR>

" Enable NERDtree
" autocmd vimenter * if !argc() | NERDTree | endif

let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_synchronize_focus = 1
let g:nerdtree_tabs_focus_on_files = 1

let g:NERDTreeWinSize=60
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeChDirMode=0
let g:NERDSpaceDelims=1

" React indentation
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

noremap <Leader>nf :NERDTreeTabsFind<CR>

" Ack
nnoremap <leader>a :Ack!<space>

let g:ackprg = 'ag --nogroup --nocolor --column'

" CtrlP
" ------------------------------------------------------------------------------
let g:ctrlp_map = '<Leader>t'

let g:ctrlp_user_command = {
\ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
\ 'fallback': 'find . -type f | egrep "^\.[\/.]\.(git/|hg|svn/|gitmodules|DS_Store)"'
\ }

" map <Leader>ne :NERDTree<CR>

map <Leader>ne <plug>NERDTreeTabsToggle<CR>

" let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
let g:rspec_runner = 'os_x_terminal'

let g:rspec_command = "bundle exec rspec {spec}"

nnoremap <Leader>r :call RunCurrentSpecFile()<CR>
" nnoremap <Leader>s :call RunNearestSpec()<CR>
" nnoremap <Leader>l :call RunLastSpec()<CR>

set nowrap

nnoremap Q <nop>

" Multiple Cursors
" -----------------------------------------------------------------------------

let g:multi_cursor_start_key='<C-m>'
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" -----------------------------------------------------------------------------

" below from https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='bubblegum'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
" nmap <leader>T :enew<cr>

" Move to the next buffer
" nmap <silent><space>l :bnext

" Move to the previous buffer
" nmap <silent><space>h :bprevious

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

noremap <Leader>mc :cclose<CR>

" enable line numbers
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1

" Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger="<c-tab>"

let g:sneak#label = 1

let g:sneak#s_next = 1
