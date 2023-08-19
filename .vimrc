""""""""""""""""""""""""""""""""""""""""""
" ==>> jm33-ng's nvim config <<==
""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
" ==>> python interpreter
""""""""""""""""""""""""""""""""""""""""""
" Usually you can leave this to default
" let g:python3_host_prog = '~/.pyenv/shims/python3'
" let g:python_host_prog = '/home/jm33/.pyenv/shims/python2'
""""""""""""""""""""""""""""""""""""""""""
" ==>> dein.vim
""""""""""""""""""""""""""""""""""""""""""
"dein installation------------------------------
" install dein.vim if not found, unavailable for Windows
if has('linux')
    let $CACHE = expand('~/.cache')
    if !isdirectory($CACHE)
        call mkdir($CACHE, 'p')
    endif
    if &runtimepath !~# '/dein.vim'
        let s:dein_dir = fnamemodify('dein.vim', ':p')
        if !isdirectory(s:dein_dir)
            let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
            if !isdirectory(s:dein_dir)
                execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
            endif
        endif
        execute 'set runtimepath^=' .. substitute(
                    \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
    endif
endif
"dein installation ends-------------------------
"dein Scripts-----------------------------
" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible
" Set dein base path (required)
let s:dein_base = '~/.cache/dein/'
" Set dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
" Set dein runtime path (required)
execute 'set runtimepath+=' .. s:dein_src
" Call dein initialization (required)
call dein#begin(s:dein_base)
call dein#add(s:dein_src)
" Your plugins go here:
call dein#add('wsdjeg/dein-ui.vim')
call dein#add('haya14busa/dein-command.vim')
" Generic plugins
call dein#add('Chiel92/vim-autoformat') " format everything
if has("win32") || has("win64")
    call dein#add('Yggdroot/LeaderF', {'build': 'install.bat'}) " search and stuff
else
    call dein#add('Yggdroot/LeaderF', {'build': './install.sh'}) " search and stuff
endif
call dein#add('flazz/vim-colorschemes') " add more themes
call dein#add('vim-airline/vim-airline') " status line
call dein#add('vim-airline/vim-airline-themes') " themes for status line
call dein#add('Yggdroot/indentLine') " show indent
call dein#add('vim-python/python-syntax', {'on_ft': 'python'})
call dein#add('preservim/vim-pencil', {'on_ft': ['text', 'markdown']})
" Convenience
call dein#add('jiangmiao/auto-pairs')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-surround')
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-vinegar')
call dein#add('tpope/vim-repeat')
" Autocomplete
call dein#add('prabirshrestha/asyncomplete.vim')
call dein#add('prabirshrestha/asyncomplete-lsp.vim')
call dein#add('prabirshrestha/asyncomplete-file.vim')
call dein#add('prabirshrestha/asyncomplete-neosnippet.vim')
call dein#add('prabirshrestha/asyncomplete-tags.vim')
call dein#add('prabirshrestha/asyncomplete-buffer.vim')
call dein#add('github/copilot.vim')
" tmux complete
call dein#add('prabirshrestha/async.vim')
call dein#add('wellle/tmux-complete.vim')
" snippet
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('ncm2/float-preview.nvim') " preview in floating window
" Golang
call dein#add('fatih/vim-go', {'on_ft': 'go'})
" LSP, for other languages
call dein#add('w0rp/ale') " lint everything
call dein#add('andreypopp/asyncomplete-ale.vim') " with asyncomplete.vim
call dein#add('prabirshrestha/vim-lsp') " VIM LSP framework
call dein#add('mattn/vim-lsp-settings') " sets up vim-lsp automatically
call dein#add('rhysd/vim-lsp-ale') " bridge between ale and lsp
" Markdown
call dein#add('godlygeek/tabular', {'on_ft': 'markdown'})
call dein#add('mzlogin/vim-markdown-toc', {'on_ft': 'markdown'})
call dein#add('ferrine/md-img-paste.vim', {'on_ft': 'markdown'})
if has("win32") || has("win64")
    call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
                \ 'build': 'cd app && yarn install' })
else
    call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
                \ 'build': 'sh -c "cd app && yarn install"' })
endif
" Finish dein initialization (required)
call dein#end()
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
" Enable syntax highlighting
if has('syntax')
    syntax on
endif
" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
    call dein#install()
endif
"End dein Scripts-------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> Comfortable editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread
" Set updatetime, when cursor stay still for 'updatetime', CursorHold is
" triggered
set updatetime=300
"Dismiss the start screen
set shortmess=atI
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
" Gvim settings
if !has('nvim')
    if has("gui_running")
        " set guioptions-=m  "menu bar
        set guioptions-=T  "toolbar
        set guioptions-=r  "scrollbar
        set guifont=CaskaydiaCove\ Nerd\ Font\ 14,Fixed\ 14
        set guifontwide=Noto\ Sans\ CJK\ 14
    endif
endif
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
if has("win16") || has("win32") || has("win64")
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif
"Always show current position
set ruler
" set cursorcolumn
" set cursorline
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
if has('win32') || has('win64')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
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
"" Enable syntax highlighting
syntax enable
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
            \   'json': ['jq'],
            \   'sh': ['shellcheck'],
            \   'html': ['tidy'],
            \   'rust': ['analyzer'],
            \}
" ALE-LSP
let g:lsp_ale_auto_enable_linter = 1
let g:lsp_ale_auto_config_ale = 1
let g:lsp_ale_diagnostics_severity = "warning"
let g:ale_fixers = {
            \   'lua': ['luafmt'],
            \   'jsonc': ['prettier'],
            \   'json': ['prettier'],
            \   'html': ['prettier'],
            \   'htmldjango': ['html-beautify'],
            \   'markdown': ['prettier'],
            \   'js': ['prettier'],
            \   'css': ['prettier'],
            \   'yaml': ['prettier'],
            \   'java': ['clang-format'],
            \   'c': ['clang-format'],
            \   'rust': ['rustfmt'],
            \   'cpp': ['clang-format'],
            \   'python': ['isort', 'autopep8', 'autoimport', 'add_blank_lines_for_python_control_statements'],
            \   'go': ['goimports', 'gofmt', 'remove_trailing_lines'],
            \   'sh': ['shfmt', 'remove_trailing_lines', 'trim_whitespace'],
            \}
" if linter got annoying, you can set the frq to normal
let g:ale_lint_on_text_changed = 'normal'
let g:ale_set_quickfix = 1
let g:ale_keep_list_window_open = 1
" Complete unimported
let g:ale_completion_autoimport = 1
" addition to autoformat
let g:ale_fix_on_save = 1
" Key bindings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <silent> <C-]> :ALEGoToDefinition<cr>
" nmap <silent> <C-[> :ALEFindReferences<cr>
" noremap <leader>d :ALEHover<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> IndentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_enabled = 0
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
noremap <leader>t :LeaderfBufTagAll<cr>
noremap <leader>r :Leaderf rg<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_WindowPosition = 'popup'
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0, 'File':0,}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>>  asyncomplete.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" Force refresh completion
imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
" imap <c-@> <Plug>(asyncomplete_force_refresh)
" " Preview window
" " allow modifying the completeopt variable, or it will
" " be overridden all the time
" let g:asyncomplete_auto_completeopt = 0
" set completeopt=menuone,noinsert,noselect,preview
" " To auto close preview window when completion is done.
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Complete file system path
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
            \ 'name': 'file',
            \ 'allowlist': ['*'],
            \ 'priority': 10,
            \ 'completor': function('asyncomplete#sources#file#completor')
            \ }))
" Complete from buffer
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
            \ 'name': 'buffer',
            \ 'priority': 9,
            \ 'allowlist': ['*'],
            \ 'blocklist': ['go'],
            \ 'completor': function('asyncomplete#sources#buffer#completor'),
            \ 'config': {
            \    'max_buffer_size': 5000000,
            \  },
            \ }))
" Complete from tags
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
            \ 'name': 'tags',
            \ 'priority': 8,
            \ 'allowlist': ['c'],
            \ 'completor': function('asyncomplete#sources#tags#completor'),
            \ 'config': {
            \    'max_file_size': 50000000,
            \  },
            \ }))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" if has('conceal')
"     " set conceallevel=2 concealcursor=niv
" endif
let g:vim_json_syntax_conceal = 0
" sets up prabirshrestha/asyncomplete-neosnippet.vim
if has('nvim')
    call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
                \ 'name': 'neosnippet',
                \ 'allowlist': ['*'],
                \ 'priority': 0,
                \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
                \ }))
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this functionality is handled by ALE fixers
" au BufWrite * :silent Autoformat
" let g:autoformat_autoindent = 0
" :silent! execute !autopep8 --in-place --aggressive --aggressive %" | redraw!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-lsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)
    let g:lsp_format_sync_timeout = 1000
    " refer to doc to add more commands
endfunction
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" logging
" let g:lsp_log_verbose = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> andreypopp/asyncomplete-ale.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au User asyncomplete_setup call asyncomplete#ale#register_source({
            \ 'name': 'reason',
            \ 'linter': 'flow',
            \ })
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> wellle/tmux-complete.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmuxcomplete#asyncomplete_source_options = {
            \ 'name':      'tmuxcomplete',
            \ 'whitelist': ['*'],
            \ 'config': {
            \     'splitmode':      'words',
            \     'filter_prefix':   1,
            \     'show_incomplete': 1,
            \     'sort_candidates': 0,
            \     'scrollback':      0,
            \     'truncate':        0
            \     }
            \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==>> vim-pencil
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default is 'hard'"
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text         call pencil#init()
augroup END
if (&filetype == 'markdown' || &filetype == 'text')
    let g:pencil#wrapModeDefault = 'soft'
    let g:airline_section_x = '%{PencilMode()}'
endif
