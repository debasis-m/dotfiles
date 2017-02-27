"" vim-plug (https://github.com/junegunn/vim-plug) settings 
"" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'SirVer/ultisnips'
  Plug 'alvan/vim-closetag'
  Plug 'bronson/vim-visual-star-search'
  Plug 'burnettk/vim-angular'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'honza/vim-snippets'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/seoul256.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'justinmk/vim-sneak'
  Plug 'leafgarland/typescript-vim'
  Plug 'majutsushi/tagbar'
  Plug 'matze/vim-move'
  Plug 'mhinz/vim-startify'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'pangloss/vim-javascript'
  Plug 'python-mode/python-mode'
  Plug 'rust-lang/rust.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'sickill/vim-pasta'
  Plug 'sjl/gundo.vim'
  Plug 'sts10/vim-mustard'
  Plug 'sts10/vim-zipper'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'terryma/vim-smooth-scroll'
  Plug 'tmhedberg/matchit'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-scripts/argtextobj.vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'
call plug#end()

let mapleader=","
let g:mapleader=","
let $PYHTONHOME="/Library/Frameworks/Python.framework/Versions/3.6/"

" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos. 
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir ~/.vim/undo')
    set undodir=~/.vim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

"" Automatic reloading .vimrc
autocmd! bufwritepost .vimrc source %

"" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

"EasyAlign 
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"colorscheme desert
colorscheme seoul256
syntax on
filetype off
filetype plugin indent on
set nocompatible
set path+=**
set hidden
set splitbelow splitright
set whichwrap=b,s,<,>,[,]
set nowildmenu
set ttyfast

"Better copy paste. When you want to paste large blocks of code into
"vim, press F2 before you paste. 
set pastetoggle=<F2>
set clipboard=unnamed

"Mouse and backspace
set mouse=a  " on OSX press ALT and click
set matchpairs=(:),{:},[:],<:>
set bs=2     " make backspace behave like normal
set autoindent
set nostartofline

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set encoding=utf8
set diffopt=filler,icase,iwhite

"Quicksave command
noremap <C-z> <esc>:w<cr>
inoremap <C-z> <esc>:w<cr>
nnoremap <C-z> :w<cr>
set foldmethod=indent

"Display all matching files when we tab complete
set wildmenu
set complete-=i
set ttimeout
set ttimeoutlen=100
set display+=lastline

"Showing line numbers and length
set relativenumber
set number
set tw=79
set nowrap
set fo-=t
""set colorcolumn=80
set sessionoptions-=options

" bind Ctrl+<movement> keys to move around the windows, 
" instead of using Ctrl+w + <movement>
""map <c-j> <c-w>j
""map <c-k> <c-w>k
""map <c-l> <c-w>l
""map <c-h> <c-w>h

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

"easier moving code blocks without lossing selection
vnoremap < <gv 
vnoremap > >gv

""easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Make the dot command work on lines selected in visual mode
vnoremap . :norm.<CR>

"run macro on lines selected in visual mode
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

""vim-zipper
autocmd FileType python setlocal foldmethod=syntax
autocmd FileType vim setlocal foldmethod=marker

nnoremap <expr> <leader>l CycleLNum()
xnoremap <expr> <leader>l CycleLNum()
onoremap <expr> <leader>l CycleLNum()

" function to cycle between normal, relative, and no line numbering
function! CycleLNum()
    if &l:rnu
        setlocal nonu nornu
    elseif &l:nu
        setlocal nu rnu
    else
        setlocal nu
    endif
    redraw
    return ""
endfunc

highlight Cursor guifg=black guibg=yellow
set bg=dark

set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:lCursor
set guicursor+=i:blinkon0

"""set cursorline

set ai
set si

set history=700
set undolevels=700

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab

set hlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set lazyredraw
set magic
set showmatch      "Show matching brackets
set mat=2          
set keymodel=startsel,stopsel
set grepprg=grep\ -HnEi
set grepformat=%f:%l:%m
set formatoptions=tcqron
set showcmd
set smartindent

"No sound on errors
set novisualbell
set noerrorbells
set t_vb=
set tm=500

set foldcolumn=1     "extra margin in left

"set nobackup
"set nowritebackup
"set noswapfile

set laststatus=2
set cmdheight=2
set showtabline=2

"A buffer becomes hidden when it is abandoned
set hid

set wildignore+=*.pyc
set wildignore+=*.o
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|DS_Store)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

map <leader>b :CtrlPBuffer<cr>
map <leader>f :CtrlPMRUFiles<cr>
let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_max_height=30
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_show_hidden=0

""nnoremap ; :
""nnoremap : ;

"Square up visual selections
set virtualedit=block

set autowrite    "Save buffer automatically when changing files
set autoread     "Always reload buffer when external changes detected
set fileformats=unix,mac,dos

set wildmode=list:longest,full
set scrolloff=4

nmap <F8> :TagbarToggle<cr>
nmap <F3> :Startify<cr>

"NerdTree
""autocmd VimEnter * NERDTree
""autocmd BufEnter * NERDTreeMirror
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
nmap <silent> <special> <F2> :NERDTreeToggle<cr>
map <leader>tb :NERDTreeFromBookmark
map <leader>tf :NERDTreeFind<cr>


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Python-mode Syntax
let g:pymode_python='python3'

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

" => JavaScript section
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

""Syntastic setting
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_javascript_checkers = ['jshint']

"Rust setting
let g:rustfmt_autosave=1

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufRead *.xsl,*.xslt,*.xml,*.htm,*.html,*.xsd,*.tas set filetype=xml
autocmd BufRead *.java set filetype=java
autocmd FileType {xml,xslt} setlocal iskeyword=$,@,-,\:,48-57,_,128-167,224-235 
autocmd FileType {xml,xslt} setlocal noexpandtab

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"bufEplorer plugin
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


let g:user_emmet_mode='a'    "enable all function of emmet in all mode.

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

noremap <silent> <F5> :noh <bar> :AirlineRefresh <bar> :redraw <CR>
noremap <silent> <F6> !ctags -R<CR>

let g:rustfmt_autosave=1

noremap <silent> <c-e> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR> 
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR> 
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"vim-move
let g:move_key_modifier='C'

"paste with indentation
let g:pasta_paste_before_mapping = ',P'
let g:pasta_paste_after_mapping = ',p'

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml"

"Session Management
let g:session_directory="~/.vim/session"
let g:session_autoload="no"
let g:session_autosave="no"
let g:session_command_aliases=1
nnoremap <leader>so :OpenSession<cr>
nnoremap <leader>ss :SaveSession<cr>
nnoremap <leader>sd :DeleteSession<cr>
nnoremap <leader>sc :CloseSession<cr>

"" Gundo
let g:gundo_width=60
let g:gundo_preview_height=40
let g:gundo_right=1

"easymotion
map <space> <Plug>(easymotion-s)

command! -nargs=0 Date      :put ='* ' . strftime('%b %d, %Y %I:%M %p')
command! -nargs=0 Noh       :noh
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

"" Angular-vim
let g:angular_source_directory='app/source'
let g:angular_test_directory='test/units'
let g:angular_skip_alternate_mappings=1
let g:angular_find_ignore=['build/', 'dist/']

"" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


