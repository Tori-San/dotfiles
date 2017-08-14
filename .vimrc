set nocompatible
" Fancy colours
set t_Co=256
colorscheme jellybeans
" Transparency
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
let g:jellybeans_use_term_italics = 1

set ruler
set history=50
set mouse=a

" Syntax highlighing
syntax on
set hlsearch

" Indenting
filetype plugin on
filetype plugin indent on

" Spaces > Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" line numbers
set number
set relativenumber

" Airline
set laststatus=2
let g:airline_theme='bubblegum'
set noshowmode
let g:bufferline_echo = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" LaTeX
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "exec zathura"
let g:Tex_CompileRule_pdf = "pdflatex"
autocmd FileType tex call Tex_MakeMap("<Leader>ll", ":w <CR> <Plug>Tex_Compile", 'n', '<buffer>')
autocmd FileType tex call Tex_MakeMap("<Leader>ll", "<ESC> :w <CR> <Plug>Tex_Compile", 'v', '<buffer>')

" Whitespace highlighting
set list
set listchars=tab:>.,trail:.,nbsp:.

" Forgot sudo?
cmap w!! w !sudo tee % >/dev/null

" Use system clipboard for yy/p etc.
set clipboard=unnamedplus

" Pick up where you left off
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Execution
nnoremap <F5> :w<CR>:!%:p<CR>
inoremap <F5> <ESC>:w<CR>:!%:p<CR>

" Buffer switching
"noremap gb=:bn<CR>
"noremap gB=:bN<CR>
