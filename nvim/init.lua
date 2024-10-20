-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- True colors
vim.opt.termguicolors = true

-- Set autoread when a file is changed from the outside
vim.opt.autoread = true

-- Set updatetime, when cursor stays still for 'updatetime', CursorHold is triggered
vim.opt.updatetime = 300

-- Dismiss the start screen
vim.opt.shortmess:append("atI")

-- Set leader key
vim.g.mapleader = ","

-- Fast saving
vim.api.nvim_set_keymap("n", "<leader>w", ":w!<CR>", { noremap = true, silent = true })
-- Quit without saving
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
-- Save and quit
vim.api.nvim_set_keymap("n", "<leader>x", ":wq<CR>", { noremap = true, silent = true })
-- Startify
vim.api.nvim_set_keymap("n", "<leader>s", ":Startify<CR>", { noremap = true, silent = true })
-- Hex edit
vim.cmd([[command! XXD %!xxd]])
-- Remove trailing whitespaces
vim.cmd([[command! T %s/\s\+$//e]])

-- ==>> VIM user interface
-- Mitigate modeline RCE
vim.opt.modeline = false

-- Gvim settings
vim.opt.guifont = "Cascadia Code NF:h14"
vim.opt.guifontwide = "Noto Sans CJK:h14"

-- Kill buffer
vim.api.nvim_set_keymap("n", "<leader>k", ":bdelete<CR>", { noremap = true, silent = true })
-- Switch to next buffer
vim.api.nvim_set_keymap("n", "<leader>l", ":bn<CR>", { noremap = true, silent = true })
-- Create new buffer
vim.api.nvim_set_keymap("n", "<leader>n", ":enew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>_", ":new<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>-", ":vnew<CR>", { noremap = true, silent = true })

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set scroll offset
vim.opt.so = 7

-- Turn on the wild menu
vim.opt.wildmenu = true

-- Ignore compiled files
vim.opt.wildignore = { "*.o", "*~", "*.pyc", ".git*", ".hg*", ".svn*" }

-- Always show current position
vim.opt.ruler = true

-- Height of the command bar
vim.opt.cmdheight = 2

-- A buffer becomes hidden when it is abandoned
vim.opt.hidden = true

-- Configure backspace behavior
vim.opt.backspace = { "eol", "start", "indent" }
vim.opt.whichwrap:append("<,>,h,l")

-- Ignore case when searching
vim.opt.ignorecase = true
-- Smart case when searching
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Incremental search
vim.opt.incsearch = true

-- Don't redraw while executing macros
vim.opt.lazyredraw = true

-- Enable magic for regex
vim.opt.magic = true

-- Show matching brackets
vim.opt.showmatch = true
-- Blink time for matching brackets
vim.opt.mat = 2

-- No sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.tm = 500

-- Add extra margin for folds
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "syntax"

-- Copy and paste
vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>p", '"+p', { noremap = true })
vim.opt.clipboard = "unnamedplus"

-- Space opens/closes folds
vim.api.nvim_set_keymap("n", "<space>", "za", { noremap = true })

-- Move to beginning/end of line
vim.api.nvim_set_keymap("n", "B", "^", { noremap = true })
vim.api.nvim_set_keymap("n", "E", "$", { noremap = true })
-- No operation for $/^
vim.api.nvim_set_keymap("n", "$", "<nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "^", "<nop>", { noremap = true })

-- ==>> Colors and Fonts
-- Enable mouse support
vim.opt.mouse = "a"

-- Set utf8 as standard encoding
vim.opt.encoding = "utf8"

-- Use Unix as the standard file type
vim.opt.fileformats = "unix,dos,mac"

-- ==>> Files, backups and undo
-- Turn backups off
vim.opt.backup = false
vim.opt.swapfile = false

-- ==>> Text, tab and indent related
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Smart tab settings
vim.opt.smarttab = true
-- 1 tab == 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Enable auto indent and smart indent
vim.opt.autoindent = true
vim.opt.smartindent = true
-- Wrap lines
vim.opt.wrap = true

-- ==>> Status line
-- Always show the status line
vim.opt.laststatus = 2

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
		-- the colorscheme should be available when starting Neovim
		{
			"folke/tokyonight.nvim",
			lazy = false, -- make sure we load this during startup if it is your main colorscheme
			priority = 1000, -- make sure to load this before all the other start plugins
			config = function()
				-- load the colorscheme here
				vim.cmd([[colorscheme tokyonight]])
			end,
		},

		-- Airline
		{
			"vim-airline/vim-airline",
			lazy = false, -- make sure we load this during startup if it is your main colorscheme
			priority = 1000, -- make sure to load this before all the other start plugins
			dependencies = {
				"vim-airline/vim-airline-themes",
			},
		},

		-- Git
		{ "tpope/vim-fugitive" },

		-- Auto complete pairs
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
			-- use opts = {} for passing setup options
			-- this is equivalent to setup({}) function
		},

		-- markdown table formatter
		{ "dhruvasagar/vim-table-mode", ft = "markdown" },

		-- markdown TOC
		{ "mzlogin/vim-markdown-toc", ft = "markdown" },

		-- Toggle comments
		{ "tomtom/tcomment_vim", lazy = true },

		-- GitHub Copilot
		{
			"github/copilot.vim",
			event = "InsertEnter",
		},

		-- I have a separate config.mappings file where I require which-key.
		-- With lazy the plugin will be automatically loaded when it is required somewhere
		{ "folke/which-key.nvim", lazy = true },

		{
			"nvim-neorg/neorg",
			-- lazy-load on filetype
			ft = "norg",
			-- options for neorg. This will automatically call `require("neorg").setup(opts)`
			opts = {
				load = {
					["core.defaults"] = {},
				},
			},
		},

		{
			"dstein64/vim-startuptime",
			-- lazy-load on a command
			cmd = "StartupTime",
			-- init is called during startup. Configuration for vim plugins typically should be set in an init function
			init = function()
				vim.g.startuptime_tries = 10
			end,
		},

		-- Indent lines
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			---@module "ibl"
			---@type ibl.config
			opts = {},
			config = function()
				vim.g.indent_blankline_char = "│"
				vim.g.indent_blankline_filetype_exclude = { "help", "dashboard", "packer" }
				vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
				vim.g.indent_blankline_show_trailing_blankline_indent = false
				vim.g.indent_blankline_show_first_indent_level = false
				require("ibl").setup()
			end,
		},

		-- LSP
		{
			"neovim/nvim-lspconfig",
			config = function() end,
		},

		-- Formatter
		{
			"stevearc/conform.nvim",
			opts = {},
			config = function()
				require("conform").setup({
					formatters_by_ft = {
						lua = { "stylua" },
						bash = { "shfmt" },
						sh = { "shfmt" },
					},
					format_on_save = {
						-- These options will be passed to conform.format()
						timeout_ms = 500,
						lsp_format = "fallback",
					},
				})
			end,
		},

		-- Treesitter for syntax highlighting
		{
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					-- Automatically install missing parsers when entering buffer
					-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
					auto_install = true,
					highlight = {
						enable = true,
						ensure_installed = {
							"python",
							"go",
							"gomod",
							"bash",
							"c",
							"cpp",
							"csv",
							"dockerfile",
							"git_config",
							"passwd",
							"ssh_config",
							"strace",
							"lua",
							"vim",
							"vimdoc",
							"query",
							"elixir",
							"heex",
							"json",
							"javascript",
							"html",
							"xml",
							"yaml",
							"toml",
							"rust",
							"powershell",
						},
						highlight = { enable = true },
						indent = { enable = true },
					},
				})
			end,
		},

		-- Tag bar
		{ "preservim/tagbar" },

		-- Telescope: fzf and ripgrep
		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require("telescope").setup({
					defaults = {
						file_ignore_patterns = { ".git/", "node_modules/", "vendor/" },
					},
				})
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
				vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
				vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
				vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			end,
		},

		-- Tabline
		{
			"akinsho/bufferline.nvim",
			version = "*",
			dependencies = "nvim-tree/nvim-web-devicons",
			config = function()
				require("bufferline").setup({})
			end,
		},

		-- file explorer
		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("nvim-tree").setup({})

				vim.keymap.set("n", "<C-P>", ":NvimTreeToggle<CR>")
			end,
		},

		-- auto completion
		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			lazy = true,
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-vsnip",
				"hrsh7th/vim-vsnip",
			},
			config = function()
				local has_words_before = function()
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0
						and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
				end

				local feedkey = function(key, mode)
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
				end

				local cmp = require("cmp")

				cmp.setup({
					snippet = {
						expand = function(args)
							vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						end,
					},
					mapping = {
						["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item.
						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif vim.fn == 1 then
								feedkey("<Plug>(vsnip-expand-or-jump)", "")
							elseif has_words_before() then
								cmp.complete()
							else
								fallback() -- Fallback to Copilot or other mappings
							end
						end, { "i", "s" }),
						["<S-Tab>"] = cmp.mapping(function()
							if cmp.visible() then
								cmp.select_prev_item()
							elseif vim.fn["vsnip#jumpable"](-1) == 1 then
								feedkey("<Plug>(vsnip-jump-prev)", "")
							end
						end, { "i", "s" }),
					},
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "vsnip" }, -- For vsnip users.
					}, {
						{ name = "buffer" },
					}),
				})
			end,
		},
	},

	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- GitHub Copilot keybindings
vim.g.copilot_no_tab_map = true -- Disable Copilot's default <Tab> mapping
vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities() --nvim-cmp

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Go to definition
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts) -- Go to declaration
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts) -- Show hover information
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts) -- Go to implementation
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts) -- Rename symbol
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts) -- Show code actions
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts) -- Show all references
	vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, bufopts) -- Search workspace symbols
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts) -- Show diagnostics in floating window
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts) -- Go to previous diagnostic
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts) -- Go to next diagnostic
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts) -- Show signature help
	vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts) -- Go to type definition
	vim.keymap.set("n", "<leader>f", ":TagbarToggle<CR>") -- Tagbar

	-- Auto format on save
	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ async = false })
		end,
	})

	-- Auto organize imports on save
	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = bufnr,
		callback = function()
			local params = vim.lsp.util.make_range_params() -- Get the buffer range
			params.context = { only = { "source.organizeImports" } } -- Limit to organize imports

			-- Request code actions for organizing imports
			local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)

			for _, res in pairs(result or {}) do
				for _, r in pairs(res.result or {}) do
					if r.edit then
						vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
					else
						vim.lsp.buf.execute_command(r.command)
					end
				end
			end
		end,
	})
end

-- Setup lspconfig.
local nvim_lsp = require("lspconfig")

-- setup languages
require("lspconfig").gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,

	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,
			hoverKind = "FullDocumentation", -- Show more detailed hover info
			usePlaceholders = true, -- Use placeholders in completion
			completeUnimported = true, -- Include completions from unimported packages
			matcher = "fuzzy",
			codelenses = {
				generate = true,
				gc_details = true,
				tidy = true,
				upgrade_dependency = true,
				test = true,
				tidy = true,
				regenerate_cgo = true,
				fillstruct = true,
			},
		},
	},
})

require("lspconfig").pylsp.setup({
	on_attach = on_attach,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					enabled = true,
					ignore = { "E501", "W503", "E731" },
					maxLineLength = 100,
				},
				black = { enabled = true }, -- Enable black as the formatter
				pyflakes = { enabled = false }, -- Disable pyflakes if you want to use flake8
				flake8 = {
					enabled = true,
					maxLineLength = 100,
					ignore = { "E501", "W503", "E731" },
				}, -- Optionally, you can enable flake8 for linting
			},
		},
	},
})

require("lspconfig").bashls.setup({})

-- https://github.com/hrsh7th/vscode-langservers-extracted
require("lspconfig").jsonls.setup({
	on_attach = on_attach,
})

require("lspconfig").clangd.setup({
	on_attach = on_attach,
})

require("lspconfig").vimls.setup({
	on_attach = on_attach,
})
