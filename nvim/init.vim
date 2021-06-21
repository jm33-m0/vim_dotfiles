""""""""""""""""""""""""""""""""""""""""""
" ==>> jm33-ng's nvim config
""""""""""""""""""""""""""""""""""""""""""

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=HOME/.dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('HOME/.dein')

" Let dein manage dein
" Required:
call dein#add('HOME/.dein/repos/github.com/Shougo/dein.vim')

" dein
call dein#add('wsdjeg/dein-ui.vim')
call dein#add('haya14busa/dein-command.vim')

" Generic plugins
call dein#add('w0rp/ale') " lint everything
call dein#add('Chiel92/vim-autoformat') " format everything
call dein#add('Yggdroot/LeaderF', {'build': './install.sh'}) " search and stuff
call dein#add('flazz/vim-colorschemes') " add more themes
call dein#add('vim-airline/vim-airline') " status line
call dein#add('vim-airline/vim-airline-themes') " themes for status line
call dein#add('Yggdroot/indentLine') " show indent
call dein#add('vim-python/python-syntax', {'on_ft': 'python'})

" Convenience
call dein#add('tomtom/tcomment_vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('tpope/vim-surround')
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-vinegar')
call dein#add('tpope/vim-repeat')

" autocomplete
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('ncm2/float-preview.nvim') " preview in floating window
" tabnine
if has('win32') || has('win64')
    call dein#add('tbodt/deoplete-tabnine', { 'build': 'powershell.exe .\install.ps1' })
else
    call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })
endif

" Dev
call dein#add('fatih/vim-go', {'on_ft': 'go'})
call dein#add('deoplete-plugins/deoplete-jedi', {'on_ft': 'python'})

" Markdown
call dein#add('godlygeek/tabular', {'on_ft': 'markdown'})
call dein#add('mzlogin/vim-markdown-toc', {'on_ft': 'markdown'})
call dein#add('ferrine/md-img-paste.vim', {'on_ft': 'markdown'})
call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})


" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" " If you want to install not installed plugins on startup.
" if dein#check_install()
"     call dein#install()
" endif

"End dein Scripts-------------------------


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> Comfortable editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread

" Set updatetime, when cursor stay still for 'updatetime', CursorHold is
" triggered
set updatetime=300

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
set cmdheight=2

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
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" copy and paste
noremap <Leader>y "+y
noremap <Leader>p "+p
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

" colors
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
    colorscheme molokai_dark
    " colorscheme molokai
catch
    colorscheme default
endtry

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
let g:ale_go_golangci_lint_options = '-E unparam -E goconst -E gofmt'
" package level please
let g:ale_go_golangci_lint_package = 1

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'rust': ['rls'],
            \   'python': ['pylint'],
            \   'c': ['clangd'],
            \   'go': ['gopls', 'golangci-lint', 'vet'],
            \   'cpp': ['clangd'],
            \   'sh': ['shellcheck'],
            \}

let g:ale_fixers = {
            \   'python': ['isort', 'add_blank_lines_for_python_control_statements'],
            \}

" if linter got annoying, you can set the frq to normal
let g:ale_lint_on_text_changed = 'normal'
let g:ale_set_quickfix = 1
let g:ale_keep_list_window_open = 1

" Complete unimported
let g:ale_completion_autoimport = 1

let g:ale_fix_on_save = 1

" Key bindings
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-]> :ALEGoToDefinition<cr>
nmap <silent> <C-[> :ALEFindReferences<cr>
noremap <leader>d :ALEHover<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> IndentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_enabled = 1
let g:indentLine_char = '▏'
" let g:indentLine_setColors = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> Vim-Airline Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'minimalist'
" let g:airline_powerline_fonts = 0
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> Leaderf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-n>'
let g:Lf_RgConfig = [
            \ "--max-columns=150",
            \ "--glob=!node_modules/*",
            \ "--glob=!dist/*",]
" noremap <leader>u :LeaderfMru<cr>
noremap <leader>f :LeaderfFunction<cr>
" noremap <leader>b :LeaderfBuffer<cr>
" noremap <leader>m :LeaderfTag<cr>
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:float_preview#docked = 0
set completeopt-=preview
call deoplete#custom#var('tabnine', {
            \ 'line_limit': 500,
            \ 'max_num_results': 10,
            \ })
" " sources
" " Use ALE and also some plugin 'foobar' as completion sources for all code.
" call deoplete#custom#option('sources', {
"             \ '_': ['ale', 'tabnine', 'vim-go'],
"             \})
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> neosnippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufWrite * :silent Autoformat
let g:autoformat_autoindent = 0
" :silent! execute !autopep8 --in-place --aggressive --aggressive %" | redraw!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_metalinter_command = 'golangci-lint'
let g:go_rename_command = 'gopls'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = 'gopls'
let g:go_doc_keywordprg_enabled = 0
let g:go_gocode_autobuild = 1
let g:go_gocode_unimported_packages = 1
let g:go_go_code_completion_enabled = 0
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
" popup window for GoDoc
let g:go_doc_popup_window = 1

" let deoplete autocomplete golang
" call deoplete#custom#option('omni_patterns', {'go': '[^. *\t]\.\w*'})

" key bindings
nmap <leader>gr :GoReferrers<cr>
" nmap <leader>d :GoDoc<cr>
nmap <leader>rn :GoRename<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-lsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
