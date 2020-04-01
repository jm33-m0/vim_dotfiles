"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""jm33_ng's VIMRC""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
call plug#begin('~/.vim/bundle')

" General dev
Plug 'w0rp/ale' " general linter
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --clang-completer --go-completer' } " general completer
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' } " tag list
Plug 'liuchengxu/vista.vim',
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " file explorer
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'Chiel92/vim-autoformat'
" Plug 'junegunn/vim-easy-align' " too difficult to use!
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " Ctrl-P search
Plug 'Yggdroot/indentLine', { 'for': ['python', 'markdown', 'html', 'sh'] }
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }

" Languages
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries'}
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'PProvost/vim-ps1', { 'for': 'ps1' }
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'chazy/cscope_maps', { 'for': 'c' }

" Appearance
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
" Plug 'takac/vim-hardtime'
" Plug 'lambdalisue/vim-fullscreen' " for Windows

call plug#end()
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> Comfortable editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread

" Disable Ctrl-xxx messed-up keys
noremap <ESC>[1;5A <NOP>
noremap <ESC>[1;5B <NOP>
noremap <ESC>[1;5C <NOP>
noremap <ESC>[1;5D <NOP>
noremap <ESC>[1;5H <NOP>
noremap <ESC>[1;5F <NOP>
noremap <ESC>[5;5~ <NOP>
noremap <ESC>[6;5~ <NOP>
noremap! <ESC>[1;5A <NOP>
noremap! <ESC>[1;5B <NOP>
noremap! <ESC>[1;5C <NOP>
noremap! <ESC>[1;5D <NOP>
noremap! <ESC>[1;5H <NOP>
noremap! <ESC>[1;5F <NOP>
noremap! <ESC>[5;5~ <NOP>
noremap! <ESC>[6;5~ <NOP>

"Dismiss the start screen
set shortmess=atI

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode = 1
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
" Quit without saving
nmap <leader>q :q<cr>
" Save and quit
nmap <leader>x :wq<cr>
" Startify
nmap <leader>s :Startify<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Hex edit
command XXD %!xxd

" Set paste
set pastetoggle=<F8>

" Remove trailing whitespaces
command T %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mitigate modeline RCE
set nomodeline

" kill buffer
nmap <leader>k :bdelete<CR>
" Switch to next buffer
nmap <leader>l :bn<CR>
" nmap <leader>p :bp<CR>
nmap <leader>n :enew <CR>
nmap <leader>_ :new <CR>
nmap <leader>- :vnew <CR>

" set nu
set number relativenumber
" set nonumber norelativenumber  " turn hybrid line numbers off
" set !number !relativenumber    " toggle hybrid line numbers

" show invisible characters
" set list

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler
" set cursorcolumn
set cursorline

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" copy and paste
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
if has('win32')
    set clipboard=unnamed
" else
"     set clipboard=unnamedplus
endif

" space open/closes folds
nnoremap <space> za

" move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on
autocmd BufEnter * :syntax sync fromstart " syntax highlighting breaks when paging up/down

" python-syntax
let g:python_highlight_all = 1

let g:rehash256 = 1
let g:molokai_original = 1
set background=dark
set t_Co=256
if &term =~# '256color' && ( &term =~# '^screen'  || &term =~# '^tmux'  )
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif


try
    " colorscheme mod8
    " colorscheme molokai_dark
    colorscheme molokai
catch
    colorscheme default
endtry

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

if has("gui_running")
    " Set a nicer font.
    set guifont=ubuntu\ mono\ 13
    " Set window size
    set lines=36
    set columns=136
    " Hide the toolbar.
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif


let base16colorspace=256
if (has("termguicolors"))
    set termguicolors
endif

" Set utf8 as standard encoding and en_US as the standard language
" and separator
set encoding=utf8
set fillchars=vert:│

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Controls pop-up window color
highlight clear SpellBad
highlight SpellBad term=undercurl cterm=undercurl ctermfg=009 ctermbg=NONE guifg=#ff0000 guibg=NONE
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
" highlight Pmenu ctermfg=7 ctermbg=234 guibg=#d0d0d0 guifg=#8a8a8a
highlight Search cterm=NONE ctermfg=grey ctermbg=black guibg=#2a241a guifg=#8a8a8a
" highlight CursorColumn ctermbg=234 guibg=#d0d0d0
" highlight CursorLine ctermbg=234 guibg=#d0d0d0



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
"set lbr
"set tw=80
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines



""""""""""""""""""""""""""""""
" ==>> Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
" Height of the command bar
set cmdheight=1


""""""""""""""""""""""""""""""
" ==>> Plugs
""""""""""""""""""""""""""""""

"""""""""""" gtags
set cscopeprg='gtags-cscope'
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = expand('~/.vim/gtags.conf')

"""""""""""" vim-gutentags
let g:gutentags_modules = ['gtags_cscope']
" let g:gutentags_modules = ['ctags']
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_define_advanced_commands = 1

"""""""""""" YCM conf
" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>
map <F12> :YcmCompleter GoToDefinition<CR>
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
" let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_key_invoke_completion = '<c-space>'

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \}

let g:ycm_filetype_blacklist = {
            \ 'tagbar': 1,
            \ 'qf': 1,
            \ 'notes': 1,
            \ 'markdown': 1,
            \ 'unite': 1,
            \ 'text': 1,
            \ 'vimwiki': 1,
            \ 'pandoc': 1,
            \ 'infolog': 1,
            \ 'mail': 1
            \}



"""""""""""" ALE linters
let g:ale_completion_enabled = 0
let g:ale_open_list = 0
let g:ale_set_loclist = 0
let g:ale_lint_on_enter = 1
" let g:ale_rust_rls_toolchain = 'stable'

" better error sign
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" parse Makefile, to recognize include path
let g:ale_c_parse_makefile = 1
let g:ale_c_parse_compile_commands = 1

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

" let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
" let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" do NOT enable-all go linters
let g:ale_go_golangci_lint_options = ''
" package level please
let g:ale_go_golangci_lint_package = 1

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'rust': ['rls'],
            \   'python': ['pylint'],
            \   'cpp': ['cppcheck'],
            \   'go': ['golangci-lint'],
            \   'sh': ['shellcheck'],
            \}

let g:ale_fixers = {
            \   'python': ['isort', 'add_blank_lines_for_python_control_statements'],
            \}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" if linter got annoying, you can set the frq to normal
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_set_quickfix = 1
" let g:ale_keep_list_window_open = 1

"""""""" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '▏'
" let g:indentLine_setColors = 0

"""""""" LeaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-n>'
noremap <leader>u :LeaderfMru<cr>
noremap <leader>f :LeaderfFunction<cr>
noremap <leader>b :LeaderfBuffer<cr>
noremap <leader>m :LeaderfTag<cr>
noremap <leader>r :Leaderf rg<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
" let g:Lf_WindowPosition = 'popup'

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"""""""" Vim-Airline Configuration
let g:airline_theme = 'minimalist'
" let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let airline#extensions#c_like_langs = ['c', 'cpp', 'cuda', 'go', 'javascript', 'ld', 'php']
" for C files, disable Airline whitespace warning
au bufenter *.c :silent! call airline#extensions#whitespace#disable()
au bufenter *.ino :silent! call airline#extensions#whitespace#disable()
au bufenter *.md :silent! call airline#extensions#whitespace#disable()

" symbols and fonts
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 's'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"""""""""""""""""" vim-go
" since we have ALE enabled, vim-go doesn't have to run lint here
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_rename_command = 'gopls'
let g:go_fmt_command = "goimports"
let g:go_gocode_autobuild = 1
let g:go_gocode_unimported_packages = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_methods = 1
set autowrite

nmap <leader>gr :GoReferrers<cr>

"""""""""""""""""" Tagbar
nmap <C-b> :Vista!!<CR>
let g:vista#renderer#enable_icon = 0

"""""""""""""""""" vim-visual-multi
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-z>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-z>'           " replace visual C-n


"""""""""""""""""" NerdTree

" Auto starts NerdTREE
" autocmd vimenter * NERDTree

" Toggle NerdTREE
" map <C-z> :NERDTreeToggle<CR>
" map <C-z> :Vexplore<CR>


" How can I close vim if the only window left open is a NERDTree?
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""" vim-snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""""" vim-autoformat
au BufWrite * :silent Autoformat
let g:autoformat_autoindent = 0
" :silent! execute !autopep8 --in-place --aggressive --aggressive %" | redraw!

"""""""""""""""""" vim-markdown
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
