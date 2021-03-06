"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""jm33_ng's VIMRC""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
call plug#begin('~/.vim/bundle')

" Primary
Plug 'w0rp/ale', { 'for': ['sh', 'rust'] } " general linter
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': ':CocInstall coc-pyright coc-vimlsp coc-eslint coc-clangd coc-sh coc-json coc-yaml coc-tsserver coc-html coc-xml coc-css' } " language specific plugins
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries'}
" Plug 'govim/govim', { 'for': 'go' }
Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " Ctrl-P search
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" Appearance
Plug 'PProvost/vim-ps1', { 'for': 'ps1' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine', { 'for': ['python', 'markdown', 'html', 'sh'] }

" Convenience
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'

" Markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'ferrine/md-img-paste.vim', { 'for': 'markdown' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" Disabled
" Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
" Plug 'junegunn/vim-easy-align' " too difficult to use!
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' } " tag list
" Plug 'liuchengxu/vista.vim',
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " file explorer
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'chazy/cscope_maps', { 'for': 'c' }
" Plug 'takac/vim-hardtime'
" Plug 'lambdalisue/vim-fullscreen' " for Windows

call plug#end()
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('mac')
    set pythondll=~/.pyenv/versions/2.7.16/Python.framework/Python
    set pythonhome=~/.pyenv/versions/2.7.16
    set pythonthreedll=~/.pyenv/versions/3.7.7/Python.framework/Python
    set pythonthreehome=~/.pyenv/versions/3.7.7
endif

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
if has('linux')
    noremap <Leader>y "+y
    noremap <Leader>p "+p
else
    noremap <Leader>y "*y
    noremap <Leader>p "*p
endif
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

if has("gui_running")
    " Set a nicer font.
    if has("mac")
        set guifont=MesloLGLNerdFontCompleteM-Regular
    elseif has("gui_gtk")
        set guifont=UbuntuMono\ Nerd\ Font\ Regular\ 12
    else
        set guifont=DroidSansMono\ NF:h12
    endif
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

""""""""""""""""""""""""""""""
" ==>> Plugs
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" ==>> Gtags
""""""""""""""""""""""""""""""
set cscopeprg='gtags-cscope'
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = expand('~/.vim/gtags.conf')

""""""""""""""""""""""""""""""
" ==>> vim-gutentags
""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_completion_enabled = 0
" let g:ale_open_list = 0
" let g:ale_set_loclist = 0
" let g:ale_lint_on_enter = 1
" " let g:ale_rust_rls_toolchain = 'stable'
"
" " better error sign
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
"
" " parse Makefile, to recognize include path
" let g:ale_c_parse_makefile = 1
" let g:ale_c_parse_compile_commands = 1
"
" let g:ale_linters_explicit = 1
" let g:ale_completion_delay = 500
" let g:ale_echo_delay = 20
" let g:ale_lint_delay = 500
" let g:ale_echo_msg_format = '[%linter%] %code: %%s'
" let g:ale_lint_on_insert_leave = 1
" let g:airline#extensions#ale#enabled = 1
"
" " let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
" " let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
" let g:ale_c_cppcheck_options = ''
" let g:ale_cpp_cppcheck_options = ''
"
" " do NOT enable-all go linters
" let g:ale_go_golangci_lint_options = '-E unparam -E goconst -E gofmt'
" " package level please
" let g:ale_go_golangci_lint_package = 1
"
" let g:ale_linters = {
"             \   'javascript': ['eslint'],
"             \   'rust': ['rls'],
"             \   'python': ['pylint'],
"             \   'c': ['clangd'],
"             \   'go': ['gopls', 'golangci-lint', 'vet'],
"             \   'cpp': ['clangd'],
"             \   'sh': ['shellcheck'],
"             \}
"
" let g:ale_fixers = {
"             \   'python': ['isort', 'add_blank_lines_for_python_control_statements'],
"             \}
"
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" if linter got annoying, you can set the frq to normal
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_set_quickfix = 1
" let g:ale_keep_list_window_open = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> IndentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_enabled = 1
let g:indentLine_char = '▏'
" let g:indentLine_setColors = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> Leaderf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-n>'
let g:Lf_RgConfig = [
            \ "--max-columns=150",
            \ "--glob=!node_modules/*",
            \ "--glob=!dist/*",]
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
" ==>> vim-snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufWrite * :silent Autoformat
let g:autoformat_autoindent = 0
" :silent! execute !autopep8 --in-place --aggressive --aggressive %" | redraw!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vim_markdown_toc_autofit = 1
" let g:vim_markdown_conceal = 0
" let g:vim_markdown_conceal_code_blocks = 0
" let g:markdown_syntax_conceal = 0
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go', 'c']

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> govim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This file represents the minimal .vimrc needed to work with govim.
"
" We also include a number of suggested settings that we think the majority of
" users will like/prefer.

" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
set ttymouse=sgr

" Suggestion: By default, govim populates the quickfix window with diagnostics
" reported by gopls after a period of inactivity, the time period being
" defined by updatetime (help updatetime). Here we suggest a short updatetime
" time in order that govim/Vim are more responsive/IDE-like
set updatetime=500

" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
set balloondelay=250

" Suggestion: Turn on the sign column so you can see error marks on lines
" where there are quickfix errors. Some users who already show line number
" might prefer to instead have the signs shown in the number column; in which
" case set signcolumn=number
set signcolumn=yes

" Suggestion: Turn on syntax highlighting for .go files. You might prefer to
" turn on syntax highlighting for all files, in which case
"
" syntax on
"
" will suffice, no autocmd required.
" autocmd! BufEnter,BufNewFile *.go,go.mod syntax on
" autocmd! BufLeave *.go,go.mod syntax off

" Suggestion: turn on auto-indenting. If you want closing parentheses, braces
" etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
" include this by default in govim.
set autoindent
set smartindent

" Suggestion: define sensible backspace behaviour. See :help backspace for
" more details
set backspace=2

" Suggestion: show info for completion candidates in a popup menu
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> COC.VIM example vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocActionAsync('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Add missing imports on save
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.py :silent call CocAction('runCommand', 'editor.action.organizeImport')
