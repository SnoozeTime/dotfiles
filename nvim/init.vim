call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'

" Language plugins
Plug 'rust-lang/rust.vim'

" config language plugin.
Plug 'cespare/vim-toml'
Plug 'ron-rs/ron.vim'

call plug#end()

" Basics...
" -----------------------------------

set hidden
set nocompatible

" Enables filetype detection, filetype-specific scripts (ftplugins),
" and filetype-specific indent scripts.
filetype plugin indent on

syntax on                    " Turns on syntax highlighting
set ruler                    " Show row and column ruler information
set number                   " Show line numbers
set spelllang=en             " Enable spell-checking
set softtabstop=4            " Number of spaces per tab
set title                    " Set the terminal title to the current file
set visualbell               " Turn on the visual bell
set cursorline               " Highlight the line under the cursor
set hidden                   " Hide inactive buffers
set ttimeoutlen=0            " Eliminate delay when switching modes
set expandtab                " Converts tabs into spaces

tnoremap <Esc> <C-\><C-n>

" Appearance
"-------------------------------------
set number
set cursorline

set t_Co=256
colorscheme gruvbox
highlight Normal ctermbg=None

" Don't display the current mode in the status line.
" This info is already displayed in the Airline status bar.
set noshowmode

" Enable mouse resize, mouse scroll, text select and so on
set mouse=a

set ttyfast           " should make scrolling faster
set lazyredraw        " should make scrolling faster

" Nerdtree
" --------
nnoremap <C-n> :NERDTreeToggle<cr>
let NERDTreeAutoDeleteBuffer = 1

" Stuff I am used to
" ------------------------------------
let mapleader=","
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>ez :e :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Move between windows
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <C-\><C-n><C-w>h
inoremap <C-j> <C-\><C-n><C-w>j
inoremap <C-k> <C-\><C-n><C-w>k
inoremap <C-l> <C-\><C-n><C-w>l

" Open terminal on split
nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr><C-w>lA

" Some servers have issues with backup files, see (coc #649)
set nobackup
set nowritebackup

" Interactive search and replace
set inccommand=nosplit
" Replace word under cursor, globally with confirmation
nnoremap <leader>k :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" VIM Wiki configuration
" -----------------------------------------------
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_auto_chdir = 0

" GIT AND ZFZ
" -----------------------------
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

nnoremap <silent> <Leader>c  :Commits<CR>
nnoremap <silent> <Leader>bc :BCommits<CR>
nnoremap <silent> <Leader>g :GFiles?

" ZFZ
" -----------------------------
nnoremap <C-P> :Files<cr>

" =================================================================================================================
" COC configuration
" --------------------------------
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" =================================================================
" Rust plugin config
" -----------------------------------------------------------------

let g:rustfmt_autosave = 1 
