set nocompatible
call plug#begin('~/.vim/vim-plug')
Plug 'flazz/vim-colorschemes'
" Plug 'nanotech/jellybeans.vim'          " color scheme
Plug 'sjl/gundo.vim'                    " allows for the undo tree (<leader>u to toggle)
Plug 'vim-airline/vim-airline'          " the airline bar
Plug 'vim-airline/vim-airline-themes'   " the airline bar themes
Plug 'lervag/vimtex',                   " for latex
            \ { 'for' : 'latex' }
Plug 'leafgarland/typescript-vim',      " typescript syntax highlighting
            \ { 'for' : 'typescript' }
Plug 'vim-syntastic/syntastic'          " external syntax checking
Plug 'scrooloose/nerdtree',             " a file explorer sidebar
            \ { 'on': ['NERDTree', 'NERDTreeToggle']}
Plug 'jlanzarotta/bufexplorer'          " to see which buffers are opened

Plug 'tpope/vim-fugitive'               " git integration into vim
Plug 'tpope/vim-rhubarb'                " github integration
Plug 'shumphrey/fugitive-gitlab.vim'    " gitlab integration
Plug 'gregsexton/gitv',                 " better git log
            \ {'on': ['Gitv']}

Plug 'SirVer/ultisnips'                 " snippets engine for vim
Plug 'honza/vim-snippets'               " the snippets

Plug 'tpope/vim-scriptease'             " vim plugin for vim plugins
Plug 'ctrlpvim/ctrlp.vim'               " fuzzy search for everything
Plug 'scrooloose/nerdcommenter'         " neat commenting features
Plug 'tpope/vim-repeat'                 " . repeats last command

Plug 'gerw/vim-HiLinkTrace'             " for showing highlighting group of elements

Plug 'vim-scripts/JavaDecompiler.vim'   " java decompiler. duh.
Plug 'godlygeek/tabular'                " Auto-alignment tool
Plug 'tpope/vim-abolish'                " Better substitution

" we need to recompile ycm for semantic completion
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --all
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()

set backup      " keep a backup file (restore to previous version)
set backupdir=$HOME/.vim/bck//,/tmp
set directory=$HOME/.vim/swp//,/tmp
set undofile    " keep an undo file (undo changes after closing)
set undodir=$HOME/.vim/undo//,/tmp
set undolevels=100000
set undoreload=100000
set history=100		" keep 50 lines of command line history
" }}}
" Tabs + Spaces {{{
set tabstop=4     " 4 spaces per TAB
set softtabstop=4 " 4 spaces per TAB in edit
set shiftwidth=4  " < and > move 4 spaces
set expandtab     " tabs are spaces
set list          " show different whitespace characters
set listchars=tab:>-,trail:~,extends:>,precedes:<
" also shows eol: set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" }}}
" Colorscheme {{{
colorscheme jellybeans
" Customization {{{
let g:jellybeans_overrides = {
\   'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
"augroup lyla_custom
"" TODO: adjust this for gui mode aswell
   "autocmd!
   "autocmd ColorScheme * highlight Folded ctermfg=255 ctermbg=022 cterm=italic
   "autocmd ColorScheme * highlight Comment ctermfg=245
   "autocmd ColorScheme * highlight vimCommand ctermfg=046
   "autocmd ColorScheme * highlight vimFuncName ctermfg=039
   "autocmd ColorScheme * highlight Normal ctermbg=none
 "augroup END
" }}}
" }}}
" Misc {{{
syntax enable
filetype indent on " load filetype specific indent files

set number         " show line numbers
set relativenumber " show relative line numbers for all except current

set cursorline " highlight line with cursor

set wildmenu   " visual autocomplete for command menu
set lazyredraw " redraw only when needed
set showmatch  " highlight matching brackets

set incsearch " search as characters are entered
set hlsearch  " highlight matches
set ignorecase " case insensitive search by default
set smartcase  " case sensitive search if pattern contains uppercase letters

set hidden  " allow modified buffers to be hidden

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

set modelines=1 " allow custom modes at the bottom of files

set clipboard=unnamed,unnamedplus   " make the system clipboard the default clipboard
" }}}
" Mouse {{{
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif
" }}}
" Plugin configuration {{{
" Airline {{{
set laststatus=2                             " show airline on all buffers
let g:airline_powerline_fonts=1              " use the powerline fonts
let g:airline_theme='bubblegum'                " use my custom theme
" }}}
" Vimtex {{{
" switch the latexmk flags to use lualatex
function! LatexSwitchToLualatex()
    let g:vimtex_compiler_latexmk = {
            \ 'options' : [
            \   '-pdf',
            \   '-lualatex',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}
endfunction

" switch the latexmk flags to use pdflatex
function! LatexSwitchToPdflatex()
    let g:vimtex_compiler_latexmk = {
            \ 'options' : [
            \   '-pdf',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}
endfunction

" allows to toggle the used compiler
function! LatexCompilerToggle()
    if g:latex_compiler_is_lualatex
        call LatexSwitchToPdflatex()
        let g:latex_compiler_is_lualatex=0
        :execute "normal \<Plug>(vimtex-reload)"
        echo "now using pdflatex"
    else
        call LatexSwitchToLualatex()
        let g:latex_compiler_is_lualatex=1
        :execute "normal \<Plug>(vimtex-reload)"
        echo "now using lualatex"
    endif
endfunction

" shortcut to toggle the latex compiler
nnoremap <leader>lp :call LatexCompilerToggle()<CR>

" start with lualatex
let g:latex_compiler_is_lualatex=1
call LatexSwitchToLualatex()
" }}}
" Gundo {{{
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" }}}
" Syntastic {{{
let g:syntastic_always_populate_loc_list=1  " automatically update where error list is shown
let g:syntastic_aggregate_errors=1          " run all checkers
let g:syntastic_auto_loc_list=1             " show error window exactly when errors are present
let g:syntastic_check_on_open=1             " run check on open and saving
let g:syntastic_check_on_wq=0               " skip checks on :wq
let g:syntastic_cpp_check_header=1          " also check headers
"let g:syntastic_cpp_remove_include_errors=1 " ignore header errors

let g:syntastic_error_symbol="\u2717"       " neat symbols
let g:syntastic_warning_symbol="\u26a0"

let g:syntastic_cpp_compiler='clang++'      " use clang++ instead of g++
" which warnings to display?
let g:syntastic_cpp_compiler_options='-std=c++14 -Weverything -Wno-shadow-field-in-constructor -Wno-c++98-compat -Wno-missing-prototypes -Wno-c++98-compat-pedantic -Wno-shorten-64-to-32 -Wno-missing-variable-declarations -Wno-exit-time-destructors -Wno-global-constructors -Wno-padded -Wno-sign-conversion'
" do not show notes as errors (no they don't show at all)
let g:syntastic_cpp_errorformat = ''.
            \     '%f:%l:%c: %trror: %m,' .
            \     '%f:%l:%c: %tarning: %m,' .
            \     '%f:%l: %trror: %m,'.
            \     '%f:%l: %tarning: %m,'

let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']   " run language check on tex files

" }}}
" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'     " the global compiler flags will be stored here
" let g:ycm_show_diagnostics_ui = 0                               " don't mess with syntastic
let g:ycm_extra_conf_globlist = ['~/contests/*']
let g:ycm_collect_identifiers_from_tags_files = 1
" }}}
" NERDTree {{{
" toogle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" open vim with NERDTree open if started without files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}
" Ultisnips {{{
let g:UltiSnipsExpandTrigger='<F5>'
let g:UltiSnipsJumpForwardTrigger='<C-J>'   " jump to next stop in snippet
let g:UltiSnipsJumpBackwardTrigger='<C-Y>'  " jump to previous stop in snippet

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'   " create custom snippets here
" }}}
"CtrlP {{{
let g:ctrlp_map = '<C-P>'   " use Ctrl-P to start CtrlP
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'    "search for root using git first, then cwd + current files folder

nnoremap <leader>p :CtrlP /<CR>
"}}}
" }}}
" Autogroups {{{
augroup configgroup
    autocmd!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END
" }}}
" Custom commands {{{
" Get a diff with the saved version of the current file
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! w !sudo tee > /dev/null %
" }}}
" Custom remaps {{{
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" space open/closes folds
nnoremap <space> za

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" save session (vim -S to restore)
nnoremap <leader>s :mksession<CR>

" visual move if ctrl is pressed
noremap <silent> <C-Right> l
noremap <silent> <C-Left> h
noremap <silent> <C-Up> gk
noremap <silent> <C-Down> gj

" move between windows if ctrl+shift is pressed
nnoremap <silent> <C-S-Right> <C-w><Right>
nnoremap <silent> <C-S-Left> <C-w><Left>
nnoremap <silent> <C-S-Up> <C-w><Up>
nnoremap <silent> <C-S-Down> <C-w><Down>

" no more page up/down for holding shift for too long
noremap <silent> <S-Up> <Up>
noremap <silent> <S-Down> <Down>
" }}}

" vim:foldmethod=marker:foldlevel=0
"
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
