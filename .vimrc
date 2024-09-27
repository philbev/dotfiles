" MY /HOME/.VIMRC INITIALISATION FILE

set encoding=utf-8
scriptencoding utf-8

"" VIM-PLUG CONFIGURATION

" The follwing lines automatically installs vim-plug if not already installed.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup vplug
        autocmd!
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.vim/plugged/')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Rip-Rip/clang_complete'
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ratazzi/blackboard.vim'
Plug 'shawncplus/Vim-tocterm'
Plug 'joelfrederico/vim-HiLinkTrace'
Plug 'ron89/thesaurus_query.vim'
Plug 'morhetz/gruvbox'
Plug 'joequery/Stupid-EasyMotion'
Plug 'easymotion/vim-easymotion'
Plug 'chazy/cscope_maps'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'Yggdroot/indentLine'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim/killersheep'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'ervandew/supertab'
    "Plug 'Shougo/deoplete.nvim'
    "Plug 'roxma/nvim-yarp'
    "Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'machakann/vim-highlightedyank'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Vin-devicons should be the last plug-in to be installed.
Plug 'ryanoasis/vim-devicons'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" Plug-vim configuration ends

"" AIRLINE CONFIGURATION

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
augroup airgroup
    autocmd!
    au VimEnter * let g:airline_left_sep = ''
    au VimEnter * let g:airline_right_sep = ''
augroup END
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ''
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

"" ULTISNIPS CONFIGURATION

let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsListSnippets = '<c-s>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsSnippetDirectories=['vim-snippets', 'UltiSnips']

"" INDENTlINE
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
let g:indentLine_setConceal = 0

"" ALE CONGIGURATION

let g:ale_linters = {'python': ['flake8'], 'vim': ['vint']}
let g:ale_fixers = {'python': ['autopep8']}
let g:ale_fix_on_save = 1


"" CONFIGURATION OPTION
filetype plugin indent on
syntax on
set incsearch
set spelllang=en
set nospell
set complete+=d,kspell
set cpoptions+=$
set dictionary=/usr/dict/words
set thesaurus=/usr/local/docs/mthesaur.txt
set listchars=tab:➤\ ,eol:↲,space:·
set noexpandtab shiftwidth=4 tabstop=8 softtabstop=4
set ignorecase smartcase
set wildmode=full wildmenu
set laststatus=2
set showcmd
set hidden
set nobackup
set hlsearch
set number relativenumber
set pastetoggle=<F11>
setlocal shortmess-=S
"set statusline=%<%t\ %y%m%r[%{\&ff}]\ \ \ \ [Buffer:\ %n]\ \ \ ASCII:\ %b:0x%B%=%-14.(%l,%c%V%)\ %P
"set statusline=%t\ %y%m%r[%{\&ff}]\ [Buffer:\ %n][ASCII:\ %b\ (Dec)\ :\ 0x%B\ (Hex)]%=%([Line:%l\ of\ %L,Column:%c%V][%p%%]%)
set runtimepath+=~/.vim/plugged
set noundofile
set history=1000
let g:clang_close_preview = 1
set omnifunc=syntaxcomplete#Complete
set cursorline
setlocal updatetime=100
if &background ==# 'light'
    set background=dark
endif

if !has('gui-running')
    set termguicolors
    highlight SpellBad ctermbg=NONE guibg=Red guifg=White
    highlight CursorLine cterm=NONE guibg=Grey40
    highlight MatchParen guibg=red
endif
" Change the color scheme here.
colorscheme desert

" Makes the background for all konsole backgrounds, no matter what the colour.
highlight Normal ctermbg=NONE guibg=#404040 guifg=White
highlight NonText ctermbg=NONE guibg=#404040 guifg=White
highlight Search term=reverse ctermbg=11 ctermfg=0 guibg=DarkGray guifg=Black
highlight WarningMsg term=standout ctermfg=224 guifg=White guibg=Red
highlight Folded guifg=yellow guibg=blue

"" AUTOCOMMANDS
augroup group1
    autocmd!
    "au VimEnter,BufRead,BufEnter,ColorScheme * colorscheme darkbg
    au VimEnter * AirlineTheme xtermlight
    "au VimEnter * AirlineTheme base16-default
    au BufWritePost .vimrc source $MYVIMRC
    "au VimEnter  * AirlineTheme base16-harmonic16
    "au BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
    au BufNewFile *.html 0r ~/.vim/templates/skeleton.html
    au BufNewFile *.h source ~/.vim/cpp_header.vim
augroup END

"" KEY MAPPINGS
nnoremap / :bn<cr>|"                                          <ALT>+/ = Next buffer.
nnoremap \ :bp<cr>|"                                          <ALT>+\ = Previous buffer.
nnoremap . :bp<cr>|"                                          <ALT>+. = Previous buffer.
nnoremap [3;3~ :bd<cr>|"                                      <Alt>+<Del> = Delete buffer.
nnoremap N n|"                                              <ALT>+N = New window.
nnoremap n |"                                             <ALT>+n = Next window.
nnoremap c c|"                                              <ALT>+c = Close window.
nnoremap o o|"                                              <ALT>+o = Only window (Close all others).
nnoremap s s|"                                              <ALT>+s = Split window.
nnoremap v v|"                                              <ALT>+v = Split window vertically.
nnoremap w w|"                                              <ALT>+w = Next window.
nnoremap z 1GO#!/usr/bin/zsh<ESC>:set ft=zsh<CR>|"            <Alt+z> = Insert #! and set filetype.
nnoremap # |"                                               <ALT>+# = Edit alternate buffer.
nnoremap [1;5B |"                                           <CTRL>+<DOWN> = Scroll up one line.
nnoremap [1;3B ddp|"                                          <ALT>+<DOWN> = Move text on current line down one line.
vnoremap [1;3B dp`[V`]|"                                      <ALT>+<DOWN> = Move selected lines down one line.
nnoremap [1;5A |"                                           <CTRL>+<UP> = Scroll up one line.
nnoremap [1;3A ddkP|"                                         <ALT>+<DOWN> = Move text on current line up one line.
vnoremap [1;3A dkkp`[V`]|"                                    <ALT>+<UP> = Move selected lines up one line.
nnoremap <Leader>b 1GO#!/usr/bin/bash<ESC>:set ft=sh<CR>|"      \b = Insert #! and set filetype.
nnoremap l :set list! list?<CR>|"                             <Alt>+l = Display whitespace characters.
nnoremap e :set expandtab! expandtab?<CR>|"                   <Alt>+e = Toggle 'Expandtab' and display.
nnoremap T ^gU$yypv$r=|"                                      <Alt>+T = Uppercase whole line and underline.
nnoremap OA gk|"                                              <Up> = Cursor up one virtual line.
nnoremap OB gj|"                                              <Down> = Cursor down one virtual line.
nnoremap i :set ic! ic?<CR>|"                                 <Alt>+i = Toggle 'Ignorecase' option.
"nnoremap zz :nnoremap j jzz<CR><Bar>:nnoremap k kzz<CR>
"nnoremap zb :nnoremap j jzb<CR><Bar>:nnoremap k kzb<CR>
"nnoremap zt :nnoremap j jzt<CR><Bar>:nnoremap k kzt<CR>

"" INSERT COMPLETIONS

inoremap z 1G#!/usr/bin/zsh<Esc>:set ft=zsh<CR>
inoremap  |"              <Ctrl>+f = Filename completion.
inoremap  |"              <Ctrl>+d = Macro completion.
inoremap  |"              <Ctrl>+l = Whole line completion.

"" VISUAL MODE MAPPINGS

vnoremap > >gv
vnoremap < <gv

"" WINDOWS KEYS FOR GERMAN CHARACTERS
inoremap @sa ä|"        <Window>+a
inoremap @sA Ä|"        <Window>+<Shift>+A
inoremap @so ö|"        <Window>+o
inoremap @sO Ö|"        <Window>+<Shift>+O
inoremap @su ü|"        <Window>+u
inoremap @sU Ü|"        <Window>+<Shift>+U
inoremap @sb ß|"        <Window>+b
inoremap @sB ß|"        <Window>+<Shift>+B
inoremap @ss ß|"        <Window>+s
inoremap @sS ß|"        <Window>+<Shift>+S

"" FUNCTION KEYS <F1> TO <F12>
nnoremap <F2> :set hlsearch! hlsearch?|"              <F2> - Toggle option 'hlsearch'
nnoremap <F3> :set spell! spell?|"                    <F3> - Toggle option 'spell'
nnoremap <F4> :set relativenumber! relativenumber?|"  <F4> - Toggle option 'number'
nnoremap <F9> :NERDTreeToggle|"                       <F9> - Toggle NERDTree
nnoremap <F12> :e ~/.vimrc<CR>|"                        <S-F12> - Edit ~/.vimrc
nnoremap <S-F12> :so ~/.vimrc<CR>|"                     <S-F12> - Edit ~/.vimrc


"" ABBREVIATIONS

"inoreab #! #!/bin/bash<ESC>:set ft=sh<CR>o
inoreab @g phil@philbevan40@gmail.com
inoreab @p phil@philbev.co.uk
inoreab pbm phil@philbev.co.uk
inoreab gm philbevan40@gmail.com
inoreab pb Phil Bevan
inoreab pba Phil Bevan<cr>Flat 3<cr>90 Loughborough Road<cr>West Bridgford<cr>Nottingham<cr>NG2 7JH

"" NERDTREE OPTIONS
let NERDTreeShowBookmarks=1

nnoremap O3P :echo "          VIM FUNCTION KEYS\n
        \               ⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺\n\n
                \<ALT>+<F1>     - Display Function Keys.\n
                \<F1>           - Vim help.\n
                \<F2>           - Toggle highlight search.\n
                \<F3>           - Toggle spell checking.\n
                \<F4>           - Toggle relative/absolute number.\n
                \<F9>           - Toggle NERDTree.\n
                \<F12>          - Source ~/.vimrc.\n"<CR>


