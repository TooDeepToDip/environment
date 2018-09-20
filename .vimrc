filetype plugin on
syntax on

" let mapleader = ","

set relativenumber
set nocompatible
set hlsearch
set showmatch
set virtualedit=all
set nu
set incsearch
set ignorecase smartcase
"set gdefault
"set nohlsearch
" Auto indent after a {
set autoindent
set smartindent
" Tabs to spaces
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set history=150
set tags=tags;/
set iskeyword+=_,$,@,%,#
set ffs=unix
"set lines=80 columns=180

"line length limit
"if exists('+colorcolumn')
"  set colorcolumn=80
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

"au BufNewFile,BufRead *.h,*.hpp,*.inc,*.c,*.cpp,*.cxx,*.php set ffs=unix
"au BufNewFile,BufRead *.as,*.ls set ffs=dos
au BufRead,BufNewFile *.go set filetype=go
au BufNewFile,BufRead *.as setf actionscript
au BufNewFile,BufRead *.mxml setf mxml
au BufNewFile,BufRead *.hx setf haxe
au BufNewFile,BufRead *.rst setf rst
au BufNewFile,BufRead *.pp setf puppet

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
"set viminfo='20,\"50,:150,%,n~/.viminfo

" dont match parenthesis
"let loaded_matchparen = 1
let g:xml_syntax_folding = 1

" change dir to current file directory
" Specially for mks FIXME
"au BufEnter * :lcd %:p:h

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Use UTF-8 as the default buffer encoding
set enc=utf-8
"set enc=koi8-r
" inoremap <ESC> <ESC>:set iminsert=0<CR>
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

set background=dark
hi clear

if(&term == "xterm" || &term == "xterm-256color")
  " 256 colors support
  set t_Co=256
  syntax reset
  colo inkpot
else
  colo desert
endif

set guifont=Mono:h12
"set guifont=Monaco:h13
"set guifont=Bitstream\ Vera\ Sans\ Mono:h14
set guioptions-=m
"set guioptions-=T

" ignore white space in diffs
set diffopt+=iwhite

" in case it doesn't exist...
silent execute '!mkdir ~/.vimbak > /dev/null 2>&1'
redraw!
"set backupdir=c:\\tmp
set nobackup
set dir=~/.vimbak

" Write swap file to disk after every 50 characters
set updatecount=50

" Show nice info in ruler
set ruler
set laststatus=2

" Name of current keymap for the statusline (not as generic as "%k")
function! Lang()
  return &iminsert ? "ru" : "en"
endfunction

function! UpdateCppTags()
  execute 'silent !uptags-cpp'
  redraw!
  execute 'cs kill -1'
  let cscopedb = readfile("/tmp/current.cscope.out")[0]
  if cscopedb != ""
    execute 'cs add ' . cscopedb
  endif
  execute 'silent !cat /dev/null > /tmp/current.cscope.out'
  redraw!
endfunction
com! UpCppTags call UpdateCppTags()

" some hotkeys for quickfix window
nmap ,p :cp<CR>
nmap ,n :cn<CR>

com! ClQFix call setqflist([])

nmap ,s :up<CR>
imap jj <Esc>
cmap jj <Esc>

"Format the statusline
set statusline=%<%F:%l,%c\ %P\ %m%r\ byte:%b\ lang:%{Lang()}\ enc:%{&encoding}\ buffer:%n\ %{&ff}

"set foldmethod=marker
" folding by syntax!
set foldmethod=syntax
set foldclose=all
set foldnestmax=1
set foldlevelstart=20
" set color for folding block
hi Folded ctermbg=7

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

set wildmode=longest,list
set hidden

" cursor line
"set nocursorline
set cursorline
"set updatetime=500
"set cursorline
" removing underlining
hi clear cursorline
" setting light grey background
hi cursorline ctermbg=236
map <silent> <F2> <ESC>:set cursorline!<CR>
imap <silent> <F2> <ESC>:set cursorline!<CR>li

" Repair wired terminal/vim settings
set backspace=start,eol,indent

" Allow file inline modelines to provide settings
set modeline

" Always confirm
set confirm

" Simplify windows navigation
set wmh=0

" top level curly braces browser
noremap [[  [[zMzvz.
noremap ]]  ]]zMzvz.

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" j,k should go into wrapped lines
map j gj
map k gk

"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>

" use CTRL-F for omni completion
imap <C-F> <C-X><C-O>

au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType python set omnifunc=pythoncomplete#Complete
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete

" omnicppcomplete preview window autoclose
au CursorMovedI * if pumvisible() == 0|pclose|endif
au InsertLeave * if pumvisible() == 0|pclose|endif

" NERDTree configuration
" Increase window size to 35 columns
let NERDTreeWinSize=35

" omnicpp option(don't show preview window)
" set completeopt="menu"

"nmap <silent> <F8> <Plug>ToggleProject

" Bufferlist pluging configuration
map <silent> <F3> :call BufferList()<CR>

" nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Close_On_Select = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1

nmap <F4> :TagbarOpenAutoClose<CR>

" Explicit paste support
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

" toggle line numbers
nmap <silent> <F6> :set number!<CR>

nnoremap <F7> "%phr_I#ifndef __<Esc>gUwyypldwidefine <Esc>yypldwiendif //<Esc>O<Esc>

let g:alternateExtensions_H = "cpp,cxx,inl,c"
let g:alternateExtensions_CPP = "h,hpp,inl"
let g:alternateNoDefaultAlternate = 1
" toggle header and implementation
"nmap <silent> <F10> :A<CR>
"nmap <F10> :exe ":!git blame -L " . eval(line(".")) . ",+1 %"<CR>
nmap <F10> :Blame 1 <CR>
com! -nargs=1 Blame :exe ":!git blame -L " . eval(line(".")) . ",+<args> %"

"get current fullname of file
com! Name :echo expand('%:p')

nmap gh :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
nmap ,ns diwinamespace <C-R>" {<ESC>o}//namespace <C-R>"<ESC>

" show yankring
"nnoremap <silent> <F11> :YRShow<CR>

set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>

map <F11> :emenu Encoding.<TAB>

nmap <F8> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" yankring settings
let g:yankring_persist = 0

let vim_start_dir = getcwd()

" fuzzyfinder
function! ProjectFuzzyFind()
  let origcurdir = getcwd()
  let curdir = origcurdir
  let prevdir = ""

  while curdir != prevdir
    if filereadable(".fuzzyfinder")
      break
    endif
    cd ..
    let prevdir = curdir
    let curdir = getcwd()
  endwhile

  if filereadable(".fuzzyfinder")
    let items = readfile(".fuzzyfinder")
    let files = []
    for n in items
      "echo curdir . "/" . n
      let files += split(glob(curdir . "/" . n), "\n")
    endfor

    call fuf#givenfile#launch('', 0, '>', files)
  endif
endfunction
let g:fuf_maxMenuWidth = 150

map ,b :FufBuffer<CR>
map ,f :FufFile<CR>
map ,t :FufBufferTag<CR>
map ,p :call ProjectFuzzyFind()<CR>

" autocomplpop
" " complete option
" "set complete=.,w,b,u,t,k
let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
" "set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 3

" put quickfix stuff into args
com! Search2Args let x={} | for d in getqflist() | let x[bufname(d.bufnr)]=1 | endfor | exe 'args ' . join(keys(x))

com! -nargs=1 Qfdo try | sil cfirst |
  \ while 1 | exec <q-args> | sil cn | endwhile |
  \ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
  \ endtry

com! -nargs=1 Qfdofile try | sil cfirst |
  \ while 1 | exec <q-args> | sil cnf | endwhile |
  \ catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/ |
  \ endtry


"!!!Using new vundle!!!
"set rtp+=~/.vim/bundle/vundle
"call vundle#rc()
"" required
"Bundle 'gmarik/vundle'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'bufferlist.vim'
"Bundle 'Align'
"Bundle 'YankRing.vim'
"Bundle 'ack.vim'
"Bundle 'ctrlp.vim'
"Bundle 'Tagbar'
"Bundle 'DirDiff.vim'
"filetype plugin indent on  " required!
"!!!Using new vundle!!!

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Before saving cut ending spaces
"autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

set background=dark
colorscheme hybrid


filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
"Plugin 'Valloric/YouCompleteMe'

"--- old plugins
Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'bufferlist.vim'
Plugin 'Align'
Plugin 'YankRing.vim'
Plugin 'ack.vim'
Plugin 'Tagbar'
Plugin 'DirDiff.vim'
"--- old plugins

call vundle#end()
execute pathogen#infect()
filetype plugin indent on
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'fileencoding' ], [ 'percent' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?"⎇  ".fugitive#head():""}',
      \   'fileencoding': '%{&fenc !=# "" ? &fenc : &enc}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \	  'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '░', 'right': '░' },
      \ 'subseparator': { 'left': '❱', 'right': '❰' }
      \ }

set laststatus=2
set noshowmode

"easymotion
"<Tab>f{char} to move to {char}
map  <Tab>i <Plug>(easymotion-bd-f)
nmap <Tab>i <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap <Tab>o <Plug>(easymotion-overwin-f2)
" Move to line
map <Tab>g <Plug>(easymotion-bd-jk)
nmap <Tab>g <Plug>(easymotion-overwin-line)
" Move to word
map  <Tab>w <Plug>(easymotion-bd-w)
nmap <Tab>w <Plug>(easymotion-overwin-w)
" Move to arrows
map <Tab>l <Plug>(easymotion-lineforward)
map <Tab>j <Plug>(easymotion-j)
map <Tab>k <Plug>(easymotion-k)
map <Tab>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

ino "<space> ""<left>
ino '<space> ''<left>
ino (<space> ()<left>
ino <T<space> template<space><><left>
ino <<space><space> <><left>
"ino <<<space> <<<space>
ino [<space> []<left>
"ino {<space> {}<left>
ino {<space> {}<left><space><space><left>
ino {<CR><space> {<CR>}<up><CR>
ino {;<space> {<CR>};<up><CR>
