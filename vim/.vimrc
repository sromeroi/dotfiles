" sromeroi vimrc settings
"----------------------------------------------------------------------
" Author: Santiago Romero - @sromeroi
"         http://github.com/sromeroi/dotfiles
"
" CHANGELOG:
"
" v1.2     2016-07-11
"          * Switched to dotfiles + stow
"
" v1.1     2015-03-29
"          * Several changes to vimrc, added update/clean scripts.
"
" v1.0     2015-03-26
"          * Switch from pathogen to vundle for plugin management.
"          * Lots of changes to vimrc file.
"          * Thanks to Makigas for his vimrc-setup youtube video!
"          * Uploaded to github (previously in bitbucket).
"
"----------------------------------------------------------------------

set nocompatible

"----------------------------------------------------------------------
" VUNDLE
"----------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"Plugin 'myusuf3/numbers.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/syntastic'
"Plugin 'joonty/vdebug'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/Command-T'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
"Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
"Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/ShowMarks'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'garbas/vim-snipmate'
" Replaced with buftabline
"Plugin 'troydm/easybuffer.vim'
Plugin 'ap/vim-buftabline'
Plugin 'AndrewRadev/undoquit.vim'
"Plugin 'dahu/Insertlessly'
" Snipmate requirements:
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'timakro/vim-searchant'
Plugin 'vimwiki/vimwiki'

" Vundle:
Plugin 'gmarik/Vundle.vim', {'name': 'vundle'}

" Colour schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'benjaminwhite/Benokai'
Plugin 'sickill/vim-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'matze/vim-move'

call vundle#end()
filetype plugin indent on

let g:snipMate = { 'snippet_version' : 1 }

""" Generic options
set nobackup
set ruler
set novisualbell
set noerrorbells
set ttyfast
set nowrap
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
"set softtabstop=4
set laststatus=2
"set number
set nonumber
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class
"set incsearch
set showmatch
"set cursorline
"set cursorcolumn
"set mouse+=a
set hlsearch

let &titleold=getcwd()
set title                " get rid of 'thanks for flying vim' message

set history=1000
"set noswapfile
set hidden

""" Paste mode (also works :r !cat + paste + Ctrl+D)
set pastetoggle=<F12>
set encoding=utf-8
set backspace=indent,eol,start

""" Save as root by using sudo with w!!
cmap w!! w !sudo tee % >/dev/null

" On wrapped lines, go up and down in the same line (THANKS Vincent Driessen!)
nnoremap j gj
nnoremap k gk
nnoremap dl dd

let mapleader=","
filetype plugin on

""" removed ,javascript,
autocmd FileType html,css,sass,scss,json
      \ setlocal shiftwidth=2 softtabstop=2

""" See trailing spaces (and remove EOL's $). Toggle with ,h
set list
set listchars=tab:->,trail:\ ,extends:#,nbsp:·
nmap <leader>h <ESC>:set list!<CR>
" Replace tabs with spaces with :retab

""" Highlight trailing whitespace
highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+\%#\@<!$/
nnoremap <Leader>ts1 :match TrailingWhitespace /\s\+\%#\@<!$/<CR>
nnoremap <Leader>ts0 :match<CR>
autocmd ColorScheme * highlight TrailingWhitespace ctermbg=red guibg=darkred

""" Highlight tabs
highlight UnwantedTab ctermbg=red guibg=darkred
match UnwantedTab /\t/
nnoremap <Leader>t1 :match UnwantedTab /\t/<CR>
nnoremap <Leader>t0 :match<CR>
autocmd ColorScheme * highlight UnwantedTab ctermbg=red guibg=darkred

""" Remove trailing spaces at EOL
nnoremap <silent> <leader>rt :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <silent> <leader>dt :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

""" Hide search results (Obsoleted by vim-searchant)
" nmap <silent> <leader>/ :nohlsearch<CR>

""" Additional ESC key in the Home row
"inoremap jk <Esc>

""" Tab completion. Use CTRL+V and TAB to insert a real tab.
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

""" Showmars a-z in a given colour:
"let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_include="abcdefghijklmnopqrstuvwxyz"

""" Hide the Showmarks column by removing all the symbols
nmap <F7> <ESC>:sign unplace *<CR>:delm!<CR>:delm A-Z0-9<CR>
nmap <leader>hs <ESC>:sign unplace *<CR>:delm!<CR>:delm A-Z0-9<CR>

""" Toggle Relative and Absolute line numbers
""" Enable / Disable line numbers
nmap <leader>n1 <Esc>:set nu<CR>:set rnu<CR>
nmap <leader>n0 <Esc>:set nonu<CR>:set nornu<CR>
nnoremap <F3> :NumbersToggle<CR>
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

""" Highlight the current cursor line
nnoremap <leader>cl :set cursorline!<CR>
nnoremap <leader>cc :set cursorcolumn!<CR>

""" Open files in the last known position
if has("autocmd")
        autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

""" Vim plugins!
map <leader>td <Plug>TaskList
map <leader>todo <Plug>TaskList
map <leader>tasklist <Plug>TaskList
"map <leader>ch <ESC>:SyntasticToggleMode<CR>
map <leader>ch <ESC>:SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" vimwiki/vimwiki
" mkdir -p ~/vimwiki/Local && ln -s ~/Dropbox/vimwiki/ ~/vimwiki/Shared
let g:vimwiki_list = [ {'path': '~/vimwiki/Shared', 'syntax': 'markdown', 'ext': '.md'},
                     \ {'path': '~/vimwiki/Local',  'syntax': 'markdown', 'ext': '.md'} ]

""" Or :UndoQuit
let g:undoquit_mapping = '<C-W>u'

let g:tagbar_width = 30
nmap <leader>t :TagbarToggle<CR>
nmap <leader>tags :TagbarToggle<CR>
nmap <leader>tagbar :TagbarToggle<CR>
map <F8> <ESC>:TagbarToggle<CR>

""" Split windows Ctrl+w - v and Ctrl+w - s and
"""               Ctrl+w - cursor to change
""" Use Ctrl+w - q to close current windiow.
""" Maps for Ctrl+h/j/k/l to move.
""" Ctrl+w _ = maximize current window (all others to size=1)
""" Ctrl+w = = equal size for all windows
""" Ctrl+w + and - = resize current window
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

""" Horizontal scrolling
map <C-L> 10zl " Scroll 10 characters to the right
map <C-H> 10zh " Scroll 10 characters to the left

""" Buffer plugins. Use :e file to open a new buffer then :bX to change
""" to buffer X. With :bd you delete the current buffer and with :buffers
""" or :ls you can see a buffer list. Use :enew to open a new, empty buffer.
"map <c-b> :b
map <leader>o :bprev<CR>
map <leader>p :bnext<CR>
map <leader>D :BD<CR>
map <leader><left> :bprev<CR>
map <leader><right> :bnext<CR>
"gf open filename under cursor

""" Insert blank line between lines for readability purposes (logs)
map <leader>G <ESC>set noai<CR><ESC>:g/.\n\n\@!/norm o<CR>

""" Buffers + Vim-buftabline
nnoremap <leader>b :enew<CR>
nnoremap <C-N> :bprev<CR>
nnoremap <C-M> :bnext<CR>
nnoremap <C-D> :bd<CR>
nnoremap <C-S-D> :bd!<CR>

""" Nerd Tree (Disabled: now using native Vim Explorer instead)
"let g:NERDTreeWinPos = "right"
"let g:NERDTreeWinSize = 25
"nmap <leader>n :NERDTreeToggle<CR>
"map <F1> <ESC>:NERDTreeToggle<CR>
" autocmd vimenter * NERDTree                 " Open nertree automatically on vim startup
" autocmd VimEnter * w,incmd p                " Then go to previous (last accessed) window.
""" Open nerdtree automatically if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""" Close vim if nertree is the only window opened
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&
"        \ b:NERDTreeType == "primary") | q! | endif

""" Vim Explorer (replaces Nerd Tree)
" d = create new directory
" % = creates and opens a new file
" D and R = Delete or Rename directory or file
" o and v = opens the file in a horizontal or vertical split
" c-w = + - resize splits to be the same (=), or alter size (+/-)
" / = find a file inside the buffer
" s = change sorting (by name, size, extension...)
let g:netrw_liststyle=3
let g:netrw_altv=1
nmap <leader>e :Explore<CR>
nmap <leader>n :Explore<CR>
map <leader>e <ESC>:Explore<CR>
autocmd FileType netrw setl bufhidden=wipe


""" Fuzzy search
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

""" vim-autoclose
let b:AutoCloseOn = 0
nmap <leader>ac <ESC>:AutoCloseToggle<CR>
nmap <leader>autoclose <ESC>:AutoCloseToggle<CR>

""" Use <space> for folding in visual and normal mode
set foldmethod=manual
vmap <space> zf
nmap <space> za
""" Remove line number from code folding
set foldtext=getline(v:foldstart)

autocmd BufWinLeave ?* mkview
""autocmd BufWinEnter ?* silent loadview
autocmd BufNewFile,BufRead *.module,*.php,*.install,*.test set filetype=php
autocmd BufNewFile,BufRead *.sql,*.dump set filetype=sql
autocmd BufWinLeave *.module,*.inc,*.h,*.c,*.css,*.js,*.sh,*.php,*.py mkview
autocmd BufWinEnter *.module,*.inc,*.h,*.c,*.css,*.js,*.sh,*.php,*.py silent loadview

""" Vim Markdown
" ]]: go to next header. <Plug>(Markdown_MoveToNextHeader)
" [[: go to previous header. Contrast with ]c. <Plug>(Markdown_MoveToPreviousHeader)
" ][: go to next sibling header if any. <Plug>(Markdown_MoveToNextSiblingHeader)
" []: go to previous sibling header if any. <Plug>(Markdown_MoveToPreviousSiblingHeader)
" ]c: go to Current header. <Plug>(Markdown_MoveToCurHeader)
" ]u: go to parent header (Up). <Plug>(Markdown_MoveToParentHeader)
set nofoldenable
let g:vim_markdown_no_default_key_mappings=1
autocmd BufNewFile,BufRead,BufReadPost,BufEnter *.md,*.mkd,*.markdown set filetype=markdown
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown

""" Autosave file folds
set foldmethod=manual
set viewoptions=folds

""" Allow save and load tab status on Windows and Mac GUI:
nmap <leader>S <ESC>:mksession! ~/vim_session<CR>
nmap <leader>L <ESC>:source ~/vim_session<CR>

""" Move lines/selections with C-j and C-k
let g:move_key_modifier = 'C'


""" Remove _ from the list of characters that are part of a word (for dw, cw...)
"set iskeyword-=_

""" Unmap cursor keys!
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

""" Filter lines containing or not containing string
" :g/PATTERN/d        (Use d_ to copy to blackhole register and save time).
" :g!/PATTERN/d       (or :v/PATTERN/d)
" :g/PATTERN/t$       ->  Copy all lines matching a pattern to end of file.
" :g/PATTERN/m$       ->  Move all lines matching a pattern to end of file.
" :g/PATTERN/s/^/\/\/ ->  Add // at the beginning of each line matching pattern.

""" Tricks from https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/

""" Quickly select the text that was just pasted. Ex: to indent it after pasting.
noremap gV `[v`]

""" Stay in visual mode when indenting.
vnoremap < <gv
vnoremap > >gv

""" Make Y yank everything from the cursor to the end of the line (like C or D).
noremap Y y$


""" START Persistent undo
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undo')
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile                " Save undo's after file closes
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif
""" END Persistent undo


""" Colours
if &t_Co > 2 || has("gui_running")
    syntax on
endif


if &t_Co == 256 || has("gui_running")
    set background=dark
    let s:scriptpath = fnamemodify(resolve(expand('<sfile>:p')), ':h')

    let s:myscheme = "molokai"

    " Check if colour scheme is present
    "let s:schemepath = s:scriptpath . '/bundle/' . s:myscheme . '/colors/' . s:myscheme . '.vim'
    let s:schemepath = $HOME . '/.vim/bundle/' . s:myscheme . '/colors/' . s:myscheme . '.vim'
    if filereadable( s:schemepath )
        exec "colorscheme " . s:myscheme
    endif

    " Check if custom changes to this schema are present
    "let s:customcolors = s:scriptpath . '/colors/' . s:myscheme . '_custom.vim'
    let s:customcolors = $HOME . '/.vim/colors/' . s:myscheme . '_custom.vim'
    if filereadable( s:customcolors )
       exec "source " . s:customcolors
    endif
    "set colorcolumn=80

    " Custom configuration for each host at ~/.vim/custom/HOSTNAME_vimrc
    let s:host_vimrc = $HOME . '/.vim/custom/' . hostname() . '_vimrc'
    if filereadable(s:host_vimrc)
          exec "source " . s:host_vimrc
    endif

    " Custom configuration for a user/host pair at ~/.vim/custom/USERNAME_HOSTNAME_vimrc
    let s:user_host_vimrc = $HOME . '/.vim/custom/' .  $USER . "_" .  hostname() . '_vimrc'
    if filereadable(s:user_host_vimrc)
          exec "source " . s:user_host_vimrc
    endif
endif

""" searchant.vim -> set color of the current search ocurrence
highlight SearchCurrent ctermbg=LightGreen ctermfg=black
highlight SpecialKey ctermfg=gray guibg=gold2

""" Hilight extraspaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

