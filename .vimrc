"DME.txt  darkblue.vim  delek.vim   elflord.vim  koehler.vim  murphy.vim  peachpuff.vim  shine.vim  torte.vim
"blue.vim    default.vim   desert.vim  evening.vim  morning.vim  pablo.vim   ron.vim        slate.vim  

execute pathogen#infect()
call pathogen#infect('~/.vim/bundle/{}')
call pathogen#infect('~/.vim/bundle/*')
"call pathogen#runtime_append_all_bundles()
filetype off
syntax on
filetype plugin indent on


set laststatus=2

set t_Co=256
set background=dark
colorscheme PaperColor

" colorscheme ron
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set mouse=a
set expandtab       " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
let mapleader=","       " leader is comma
" jk is escape
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" save session
nnoremap <leader>s :mksession<CR>
" open ag.vim
nnoremap <leader>a :Ag
map <C-o> :NERDTreeToggle<CR>



set runtimepath^=~/.vim/bundle/ctrlp.vim
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "'"



"call pathogen#infect()                      " use pathogen
"call pathogen#runtime_append_all_bundles()  " use pathogen

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


source ~/.vim/coc.vim
