set nocompatible              " be iMproved, required
filetype off                  " required

" Set line numbers for file
set number

" Set Vim to show status bar for one window too
set laststatus=2

" Set Folding for python

set foldmethod=indent
set foldnestmax=2
set foldlevel=2

" Tab based indentation for Vaultize
set noexpandtab
set softtabstop=0
set shiftwidth=4
set tabstop=4


" Set <leader> to space
let mapleader = " "

" Set arrow keys off
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Setting up Vundle - the vim plugin bundler
let hasVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
echo vundle_readme
if !filereadable(vundle_readme)
	echo "Vim"
	echo "Installing Vundle..."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
	let hasVundle=0
endif

" Vundle related settings:
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Fugutive plugin for git repos and GitHub
" Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" NERDTree Plugin for File Browsing
Plugin 'scrooloose/nerdtree'

" Syntastic Plugin for syntax checking
Plugin 'scrooloose/syntastic'

" gruvbox colorscheme set
Plugin 'morhetz/gruvbox'

" Powerline plugin 
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" PyFlake flake8-vim Plugin
" Turned off: Systastic chosen over for pylint
" Plugin 'andviro/flake8-vim'

" Python Mode plugin 
" folding, indentation, lint, motion etc
" primarily formatting, errors and folding
" Turned off now. Now its Jedied.
" Plugin 'klen/python-mode'

" Jedi Plugin for Python Auto-complete
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" ============================================================================
" Install plugins the first time vim runs

if hasVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
		:PluginInstall
endif

"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" NERDTree
nmap <leader>t :NERDTreeToggle<CR>

" Enforce pure tabbed indents
autocmd FileType python setl shiftwidth=4 tabstop=4 noexpandtab softtabstop

" gruvbox colorscheme set
colorscheme gruvbox
set background=dark

" For handling italics related issue in terminal for gruvbox
if !has("gui_running")
	let g:gruvbox_italic=0
endif

" Changes Termial to support 256 color scheme set.
set t_Co=256

" Powerline
let g:Powerline_symbols = 'fancy'

" System clipboard shared with system clipboard
set clipboard="unnamedplus"

" Easy tab navigation
nnoremap <C-l> gt
nnoremap <C-h> gT

" Show command in status line
set showcmd

" JEDI settings
let g:jedi#show_call_signatures = "0"

" " flake8-vim PyFlakes Settings
" let g:PyFlakeOnWrite = 0
" 
" let g:PyFlakeDisabledMessages = 'W191'
" 
" let g:PyFlakeCWindow = 6
" 
" let g:PyFlakeCheckers = 'pep8,mccabe,frosted'

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" Syntastic settings
fun ToggleSyntasticIfActive()
	redir => info
	silent SyntasticInfo
	redir END
	let str_active = 'Global mode: active'
	if info =~ str_active
		echo 'Syntastic Toggled'
		silent SyntasticToggleMode
	else
		echo 'Syntastic Not Toggled'
	endif
endf

autocmd FileType python call ToggleSyntasticIfActive()
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" " Python-mode
" " Activate rope
" " Keys:
" " K             Show python docs
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" " [[            Jump on previous class or function (normal, visual, operator modes)
" " ]]            Jump on next class or function (normal, visual, operator modes)
" " [M            Jump on previous class or method (normal, visual, operator modes)
" " ]M            Jump on next class or method (normal, visual, operator modes)
" let g:pymode_rope = 0 
" 
" " Documentation
" let g:pymode_doc = 1
" let g:pymode_doc_key = 'K'
" 
" "Linting
" let g:pymode_lint = 1
" let g:pymode_lint_checker = "pyflakes,pep8"
" " Auto check on save
" let g:pymode_lint_write = 1
" 
" " Support virtualenv
" let g:pymode_virtualenv = 1
" 
" " Enable breakpoints plugin
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_key = '<leader>b'
" 
" " syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
" 
" " Don't autofold code
" let g:pymode_folding = 0
