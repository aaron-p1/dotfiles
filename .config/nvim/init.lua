-- Install packer
local install_path = vim.fn.stdpath 'data' ..
	'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim '
	  .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.lua nested source <afile> | PackerCompile
  augroup end
]],
  false
)

function _registerPluginWk(config)
	assert(config.map ~= nil, 'Map cannot be nil')

	if (package.loaded['which-key']) then
		local wk = require('which-key')

		wk.register(config.map,
			{
				prefix = config.prefix or '',
				buffer = config.buffer
			})
	end
end

local helper = require'helper'

local use = require('packer').use
require('packer').startup({
	function()
		use 'wbthomason/packer.nvim'

		-- color scheme
		use {
			'morhetz/gruvbox',
			config = function ()
				vim.g.gruvbox_italic = 1
				vim.cmd [[colorscheme gruvbox]]
			end
		}

		-- small text utilities
		use 'tpope/vim-commentary'
		use 'tpope/vim-surround'
		use 'tpope/vim-unimpaired'
		use 'tpope/vim-repeat'
		use 'tpope/vim-abolish'
		use 'AndrewRadev/splitjoin.vim'
		use {
			'norcalli/nvim-colorizer.lua',
			config = function ()
				require'colorizer'.setup({'*'}, {
					rgb_fn = true,
					hsl_fn = true
				})
			end
		}
		use {
			'lukas-reineke/indent-blankline.nvim',
			config = function ()
				vim.g.indent_blankline_filetype_exclude = {
					'help', 'packer'
				}
				vim.g.indent_blankline_use_treesitter = true
				vim.g.indent_blankline_show_current_context = true
			end
		}
		use {
			'windwp/nvim-autopairs',
			after = {'nvim-compe'},
			config = function ()
				require('nvim-autopairs').setup()
				require("nvim-autopairs.completion.compe").setup({
					map_cr = true, --  map <CR> on insert mode
					map_complete = true -- it will auto insert `(` after select function or method item
				})
			end
		}

		-- config
		use {
			'editorconfig/editorconfig-vim',
			config = function ()
				vim.g.EditorConfig_exclude_patterns = {'fugitive://.*', 'scp://.*'}
			end
		}

		-- status line
		use {
			'itchyny/lightline.vim',
			config = function ()
				vim.g.lightline = {
					active = {
						right = {
							{'lineinfo'},
							{'percent'},
							{'spell', 'gitbranch', 'fileencoding', 'filetype'}
						}
					},
					inactive = {
						left = {
							{'mode', 'paste'},
							{'readonly', 'filename', 'modified'}
						},
						right = {
							{'lineinfo'},
							{'percent'},
							{'spell', 'gitbranch', 'fileencoding', 'filetype'}
						}
					},
					tabline = {
						right = {}
					},
					tab = {
						active = {'tabnum', 'filename', 'tab_modified'},
						inactive = {'tabnum', 'filename', 'tab_modified'}
					},
					component_function = {
						gitbranch = 'FugitiveHead',
					},
					tab_component_function = {
						tab_modified = 'LightlineTablineModified',
					}
				}

				function LightlineTablineModified(tabnr)
					local lastwin = vim.fn.tabpagewinnr(tabnr, '$')
					local modified = false
					local modifieable = false

					for i = 1,lastwin,1 do
						modified = modified or vim.fn.gettabwinvar(tabnr, i, '&modified') == 1
						modifieable = modifieable or vim.fn.gettabwinvar(tabnr, i, '&modifiable') == 1

						if (modified and modifieable) then
							break
						end
					end

					return modified and '+' or not modifieable and '-' or ''
				end

				vim.api.nvim_exec([[
					function! LightlineTablineModified(tabnr)
						return luaeval('LightlineTablineModified')(a:tabnr)
					endfunction
				]], false)
			end
		}

		use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate',
			config = function ()
				require('nvim-treesitter.configs').setup {
					highlight = {
						enable = true, -- false will disable the whole extension
					},
					incremental_selection = {
						enable = true,
						-- don't know if used
						keymaps = {
							init_selection = 'gnn',
							node_incremental = 'grn',
							scope_incremental = 'grc',
							node_decremental = 'grm',
						}
					},
					indent = {
						enable = true,
					},
				}
			end
		}
		use {
			'nvim-treesitter/nvim-treesitter-textobjects',
			requires = 'nvim-treesitter/nvim-treesitter',
			after = {'which-key.nvim'},
			config = function ()
				require('nvim-treesitter.configs').setup {
					textobjects = {
						select = {
							enable = true,
							lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
							keymaps = {
								-- You can use the capture groups defined in textobjects.scm
								['af'] = '@function.outer',
								['if'] = '@function.inner',
								['aa'] = '@parameter.outer',
								['ia'] = '@parameter.inner',
								['al'] = '@loop.outer',
								['il'] = '@loop.inner',
								['ac'] = '@comment.outer',
							}
						},
						move = {
							enable = true,
							set_jumps = true,
							goto_next_start = {
								[']m'] = '@function.outer',
							},
							goto_next_end = {
								[']M'] = '@function.outer',
							},
							goto_previous_start = {
								['[m'] = '@function.outer',
							},
							goto_previous_end = {
								['[M'] = '@function.outer',
							},
						},
						swap = {
							enable = true,
							swap_next = {
								['<leader>sa'] = '@parameter.inner',
								['<leader>sf'] = '@function.outer',
							},
							swap_previous = {
								['<leader>sA'] = '@parameter.inner',
								['<leader>sF'] = '@function.outer',
							},
						},
					},
				}

				_registerPluginWk{
					prefix = '<leader>',
					map = {
						s = {
							name = 'Swap',
							a = { name = 'Argument forward', },
							A = { name = 'Argument backward', },
							f = { name = 'Function forward', },
							F = { name = 'Function backward', },
						},
					}
				}
			end
		}

		-- syntax
		use {
			'sheerun/vim-polyglot',
			setup = function ()
				vim.g.polyglot_disabled = {}
			end
		}

		-- helper
		use {
			'folke/which-key.nvim',
			config = function()
				local wk = require('which-key')

				wk.setup {}

				wk.register(
					{
						t = {
							name = 'Tab'
						},
						r = {
							name = 'Compare Remote Files'
						},
					},
					{
						prefix = '<leader>'
					}
				)
			end
		}
		use {
			'phaazon/hop.nvim',
			after = {'which-key.nvim'},
			config = function()
				require'hop'.setup()

				local helper = require'helper'

				helper.keymap_cmd_leader_n_ns('hw', 'HopWord')
				helper.keymap_cmd_leader_n_ns('h1', 'HopChar1')
				helper.keymap_cmd_leader_n_ns('h2', 'HopChar2')

				helper.keymap_cmd_leader_v_ns('hw', 'HopWord')
				helper.keymap_cmd_leader_v_ns('h1', 'HopChar1')
				helper.keymap_cmd_leader_v_ns('h2', 'HopChar2')

				_registerPluginWk{
					prefix = '<leader>',
					map = {
						h = {
							name = 'Hop',
						},
					}
				}
			end
		}

		-- git
		use {
			'tpope/vim-fugitive',
			opt = true,
			cmd = {'Git', 'Gpull', 'Gstatus', 'Glog', 'Gdiffsplit',
				'Gwrite', 'Gread', 'GRename', 'GMove'}
		}
		use {
			'lewis6991/gitsigns.nvim',
			requires = {'nvim-lua/plenary.nvim'},
			config = function ()
				require('gitsigns').setup{
					keymaps = {
						-- Default keymap options
						noremap = true,

						['n ]c'] = {
							expr = true,
							"&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'",
						},
						['n [c'] = {
							expr = true,
							"&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'",
						},

						['n <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
						['v <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
						['n <leader>ghu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
						['n <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
						['v <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
						['n <leader>ghR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
						['n <leader>ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
						['n <leader>ghb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

						-- Text objects
						['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
						['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
					}
				}
			end
		}

		-- file manager
		use {
			'kyazdani42/nvim-tree.lua',
			requires = {'kyazdani42/nvim-web-devicons'},
			after = {'which-key.nvim'},
			setup = function ()
				vim.g.nvim_tree_disable_netrw = 0
				vim.g.nvim_tree_hijack_netrw = 0
			end,
			config = function ()
				local helper = require'helper'

				helper.keymap_cmd_leader_n_ns('bb', 'NvimTreeToggle')
				helper.keymap_cmd_leader_n_ns('br', 'NvimTreeRefresh')
				helper.keymap_cmd_leader_n_ns('bf', 'NvimTreeFindFile')

				_registerPluginWk{
					prefix = '<leader>',
					map = {
						b = {
							name = 'Nvim Tree'
						}
					}
				}
			end
		}

		-- fuzzy finder
		use {
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
			after = {'which-key.nvim'},
			config = function ()
				local t = require('telescope')
				t.setup {
					extensions = {
						fzf = {
							fuzzy = true,
							override_generic_sorter= false,
							override_file_sorter= false,
							case_mode = 'smart_case',
						}
					}
				}

				local helper = require'helper'
				-- file
				helper.keymap_cmd_leader_n_ns('ff', 'Telescope find_files')
				helper.keymap_cmd_leader_n_ns('fgf', 'Telescope git_files')
				helper.keymap_cmd_leader_n_ns('fr', 'Telescope live_grep')
				helper.keymap_cmd_leader_n_ns('fu', 'Telescope file_browser')
				-- vim
				helper.keymap_cmd_leader_n_ns('fb', 'Telescope buffers')
				helper.keymap_cmd_leader_n_ns('fm', 'Telescope marks')
				helper.keymap_cmd_leader_n_ns('fcr', 'Telescope current_buffer_fuzzy_find')
				-- lsp
				helper.keymap_cmd_leader_n_ns('flr', 'Telescope lsp_refrences')
				helper.keymap_cmd_leader_n_ns('fls', 'Telescope lsp_document_symbols')
				-- (maybe code actions)
				-- helper.keymap_cmd_leader_n_ns('flc', 'Telescope lsp_code_actions')
				helper.keymap_cmd_leader_n_ns('fli', 'Telescope lsp_implementations')
				helper.keymap_cmd_leader_n_ns('fld', 'Telescope lsp_definitions')
				-- git
				helper.keymap_cmd_leader_n_ns('fgc', 'Telescope git_commits')
				helper.keymap_cmd_leader_n_ns('fgb', 'Telescope git_bcommits')
				helper.keymap_cmd_leader_n_ns('fgt', 'Telescope git_stash')
				-- treesitter
				helper.keymap_cmd_leader_n_ns('ft', 'Telescope treesitter')


				_registerPluginWk{
					prefix = '<leader>',
					map = {
						f = {
							name = 'Telescope',
							g = {
								name = 'Git',
							},
							c = {
								name = 'Current Buffer',
							},
							l = {
								name = 'LSP',
							},
						},
					}
				}
			end
		}
		use {
			'nvim-telescope/telescope-fzf-native.nvim',
			requires = {'nvim-telescope/telescope.nvim'},
			after = 'telescope.nvim',
			run = 'make',
			config = function () require('telescope').load_extension('fzf') end
		}
		use {
			'nvim-telescope/telescope-dap.nvim',
			requires = {'mfussenegger/nvim-dap', 'nvim-telescope/telescope.nvim'},
			after = 'telescope.nvim',
			-- TODO keymaps for common commands
			config = function () require('telescope').load_extension('dap') end
		}

		-- snippets
		use {
			'L3MON4D3/LuaSnip',
			config = function ()
				local helper = require'helper'

				helper.keymap_expr_i_s('<Tab>', [[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']])
				helper.keymap_lua_i_ns('<S-Tab>', [[require'luasnip'.jump(-1)]])

				helper.keymap_lua_s_ns('<Tab>', [[require'luasnip'.jump(1)]])
				helper.keymap_lua_s_ns('<S-Tab>', [[require'luasnip'.jump(-1)]])

				local ls = require'luasnip'

				local parse = ls.parser.parse_snippet

				ls.snippets = {
					all = {
						parse(
							'test', 'Just testing: ${1:Stuff}'
						)
					}
				}
			end
		}

		-- lsp
		use {
			'neovim/nvim-lspconfig',
			after = {'which-key.nvim', 'lsp_signature.nvim', 'lspsaga.nvim'},
			config = function ()
				local nvim_lsp = require('lspconfig')

				local on_attach = function (client, bufnr)
					local helper = require'helper'

					-- helper functions
					local function keymap_b_cmd_n_ns(...)
						helper.keymap_b_cmd_n_ns(bufnr, ...)
					end
					local function keymap_b_cmd_leader_n_ns(...)
						helper.keymap_b_cmd_leader_n_ns(bufnr, ...)
					end
					local function keymap_b_lua_n_ns(...)
						helper.keymap_b_lua_n_ns(bufnr, ...)
					end
					local function keymap_b_lua_leader_n_ns(...)
						helper.keymap_b_lua_leader_n_ns(bufnr, ...)
					end

					local function buf_set_keymap(...)
						vim.api.nvim_buf_set_keymap(bufnr, ...)
					end
					local function buf_set_option(...)
						vim.api.nvim_buf_set_option(bufnr, ...)
					end

					buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

					keymap_b_lua_n_ns('gD', 'vim.lsp.buf.declaration()')
					keymap_b_lua_n_ns('gd', 'vim.lsp.buf.definition()')
					keymap_b_lua_n_ns('gi', 'vim.lsp.buf.implementation()')
					keymap_b_lua_n_ns('K', 'vim.lsp.buf.hover()')
					keymap_b_lua_leader_n_ns('lwa', 'vim.lsp.buf.add_workspace_folder()')
					keymap_b_lua_leader_n_ns('lwr', 'vim.lsp.buf.remove_workspace_folder()')
					keymap_b_lua_leader_n_ns(
						'lwl', 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))')
					keymap_b_lua_leader_n_ns('lD', 'vim.lsp.buf.type_definition()')
					keymap_b_lua_n_ns('gr', 'vim.lsp.buf.references()')
					keymap_b_lua_leader_n_ns(
						'le', 'vim.lsp.diagnostic.show_line_diagnostics()')
					keymap_b_lua_n_ns('[d', 'vim.lsp.diagnostic.goto_prev()')
					keymap_b_lua_n_ns(']d', 'vim.lsp.diagnostic.goto_next()')
					keymap_b_lua_leader_n_ns('lq', 'vim.lsp.diagnostic.set_loclist()')
					keymap_b_lua_leader_n_ns('lf', 'vim.lsp.buf.formatting()')

					-- lsp saga
					keymap_b_cmd_leader_n_ns('lc', 'Lspsaga code_action')
					keymap_b_cmd_n_ns('<C-k>', 'Lspsaga signature_help')
					keymap_b_cmd_leader_n_ns('lr', 'Lspsaga rename')
					keymap_b_cmd_leader_n_ns('lp', 'Lspsaga preview_definition')
					-- scroll hover doc or definition preview
					keymap_b_lua_n_ns(
						'<A-d>', [[require('lspsaga.action').smart_scroll_with_saga(1)]])
					keymap_b_lua_n_ns(
						'<A-u>', [[require('lspsaga.action').smart_scroll_with_saga(-1)]])

					-- which key
					_registerPluginWk{
						prefix = '<leader>',
						buffer = bufnr,
						map = {
							l = {
								name = 'LSP',
								w = {
									name = 'Workspace',
								}
							},
						},
					}

					-- lsp signature
					require'lsp_signature'.on_attach{
						bind = true,
						hint_prefix = '→ ',
						use_lspsaga = true
					}
				end

				local servers = {
					'dartls',
					'phpactor',
					'texlab'
				}

				for _, lsp in ipairs(servers) do
					nvim_lsp[lsp].setup {
						on_attach = on_attach,
					}
				end

				-- lua
				local runtime_path = vim.split(package.path, ';')
				table.insert(runtime_path, "lua/?.lua")
				table.insert(runtime_path, "lua/?/init.lua")

				nvim_lsp.sumneko_lua.setup {
					on_attach = on_attach,
					cmd = {'lua-language-server'},
					settings = {
						Lua = {
							runtime = {
								-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
								version = 'LuaJIT',
								-- Setup your lua path
								path = runtime_path,
							},
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = {'vim'},
							},
							workspace = {
								-- Make the server aware of Neovim runtime files
								library = vim.api.nvim_get_runtime_file("", true),
							},
							-- Do not send telemetry data containing a randomized but unique identifier
							telemetry = {
								enable = false,
							},
						},
					},
				}
			end
		}
		use {
			'hrsh7th/nvim-compe',
			config = function ()
				require'compe'.setup {
					enabled = true,
					autocomplete = true,
					source = {
						path = true,
						calc = true,
						nvim_lsp = true,
						luasnip = true
					}
				}
			end
		}
		use 'ray-x/lsp_signature.nvim'
		use {
			'glepnir/lspsaga.nvim',
			config = function ()
				require'lspsaga'.init_lsp_saga{
					code_action_keys = {
						quit = {'q', '<Esc>', '<C-c>'},
						exec = '<CR>'
					},
					rename_action_keys = {
						quit = {'q', '<Esc>', '<C-c>'},
						exec = '<CR>'
					},
					code_action_prompt = {
						enable = false
					},
				}
			end
		}

		-- diagnostics
		use {
			'folke/trouble.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			after = {'which-key.nvim'},
			config = function()
				require('trouble').setup {
					mode = 'loclist'
				}

				local helper = require'helper'

				helper.keymap_cmd_leader_n_ns('ol', 'Trouble loclist')

				_registerPluginWk{
					prefix = '<leader>',
					map = {
						o = {
							name = 'Trouble'
						}
					}
				}
			end
		}
		use {
			'dense-analysis/ale',
			config = function ()
				vim.g.ale_linters = {
					php = {'psalm', 'phpmd', 'php'}
				}

				vim.g.ale_fixers = {
					php = {'php_cs_fixer'},
					javascript = {'standard'},
					json = {'jq'},
					dart = {'dartfmt'}
				}
				vim.g.ale_virtualtext_cursor = 1
				vim.g.ale_sign_priority = 1
			end
		}

		-- dap
		use {
			'mfussenegger/nvim-dap',
			config = function ()
				local helper = require'helper'

				helper.keymap_lua_n_ns('<F1>', [[require'dap'.repl.toggle()]])
				helper.keymap_lua_n_ns('<F2>', [[require'dap'.step_over()]])
				helper.keymap_lua_n_ns('<F3>', [[require'dap'.step_into()]])
				helper.keymap_lua_n_ns('<F4>', [[require'dap'.step_out()]])
				-- continue or run
				helper.keymap_lua_n_ns('<F5>', [[require'dap'.continue()]])
				helper.keymap_lua_n_ns('<F6>', [[require'dap'.stop()]])
				helper.keymap_lua_n_ns('<F7>', [[require'dap'.run_to_cursor()]])
				helper.keymap_lua_n_ns('<F8>', [[require'dap'.toggle_breakpoint()]])
				helper.keymap_lua_n_ns(
					'<C-F8>', [[require'dap'.set_exception_breakpoints('uncaught')]])
				helper.keymap_lua_n_ns('<F9>', [[require'dap'.list_breakpoints()]])
				helper.keymap_lua_n_ns('<F10>', [[require'dap'.up()]])
				helper.keymap_lua_n_ns('<C-F10>', [[require'dap'.down()]])


				local dap = require('dap')

				-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

				dap.adapters.php = {
					type = 'executable',
					command = 'node',
					args = {
						os.getenv('HOME') .. '/.local/share/dap/vscode-php-debug/out/phpDebug.js'
					}
				}

				dap.configurations.php = {
					{
						type = 'php',
						request = 'launch',
						name = 'Listen for Xdebug',
						port = 9000,
						serverSourceRoot = '/var/www/html/',
						localSourceRoot = vim.fn.getcwd() .. '/',
					}
				}
			end
		}
		use {
			'theHamsta/nvim-dap-virtual-text',
			requires = {'mfussenegger/nvim-dap'},
			after = {'nvim-dap'},
			setup = function()
				vim.g.dap_virtual_text = true
			end
		}
		use {
			'rcarriga/nvim-dap-ui',
			requires = {'mfussenegger/nvim-dap'},
			after = {'nvim-dap'},
			config = function()
				local ui = require'dapui'

				ui.setup{
					icons = {
						expanded = '▾',
						collapsed = '▸'
					},
					mappings = {
						-- Use a table to apply multiple mappings
						expand = {'<CR>'},
						open = 'o',
						remove = 'd',
						edit = 'e',
					},
					sidebar = {
						open_on_start = true,
						elements = {
							-- You can change the order of elements in the sidebar
							'scopes',
							'breakpoints',
							'stacks',
							'watches'
						},
						width = 60,
						position = 'left' -- Can be "left" or "right"
					},
					tray = {
						open_on_start = true,
						elements = {
							'repl'
						},
						height = 10,
						position = 'bottom' -- Can be "bottom" or "top"
					},
					floating = {
						max_height = nil, -- These can be integers or a float between 0 and 1.
						max_width = nil   -- Floats will be treated as percentage of your screen.
					}
				}
			end
		}
	end,
	config = {
		display = {
			open_fn = require('packer.util').float,
		}
	}
})

helper.setOptions(vim.o, {
	-- hidden changed buffers
	'hidden',
	-- show chars bottom left
	'showcmd',
	-- highlight search
	'hlsearch',
	-- hsow position in file
	'ruler',
	-- confirm closing unsaved files
	'confirm',
	-- line numbers
	'number', 'relativenumber',
	-- don't break line inside word
	'linebreak',
	-- jump while searching
	'incsearch',
	-- search case
	'ignorecase', 'smartcase',
	-- gui colors
	'termguicolors',
	-- split buffers bottom right
	'splitbelow', 'splitright',
	-- save undo history
	'undofile',

	background = 'dark',

	timeoutlen = 500,

	completeopt = 'menuone,noselect',

	omnifunc = 'syntaxcomplete#Complete',

	showbreak = '―→',
	-- indent
	tabstop = 4,
	shiftwidth = 4,

	-- folding
	foldmethod = 'indent',
	foldlevelstart = 99,
	-- scrolling
	scrolljump = -10,
	-- spelling
	spelllang = 'de',
	spellfile = '~/.config/nvim/spell/de.utf-8.add',
	-- dict completion
	dictionary = '/usr/share/dict/ngerman,/usr/share/dict/usa',
})

-- TERMINAL
-- alt + Esc for leaving terminal
vim.api.nvim_set_keymap('t', '<A-Esc>', [[<c-\><c-n>]], { noremap = true })

--Disable numbers in terminal mode
vim.api.nvim_exec(
	[[
	augroup Terminal
	autocmd!
	autocmd TermOpen * set nonumber norelativenumber
	augroup end
	]],
	false
)

-- YANK
-- Highlight on yank
vim.api.nvim_exec(
	[[
	augroup YankHighlight
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout=300}
	augroup end
	]],
	false
)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- noh
helper.keymap_cmd_leader_n_ns('n', 'noh')

-- tab
helper.keymap_cmd_leader_n_ns('tt', 'tablast')
helper.keymap_cmd_leader_n_ns('tc', 'tabclose')
helper.keymap_cmd_leader_n_ns('to', 'tabonly')

-- syntax
helper.keymap_cmd_leader_n_ns('xs', 'syntax sync fromstart')

-- Compare Remote
local compare_remotes = {
	exo = 'scp://exoshare//var/www/html/exomind/',
}

function compareRemotes(remote)
	local local_path = vim.api.nvim_eval(
		[[system('realpath --relative-base=' . getcwd() . ' ' . expand('%:p'))]])

	if (string.sub(local_path, 1, 1) == '/') then
		vim.cmd([[echoerr 'Not a Project File: ']] .. local_path)
		return
	end

	local remote_path = compare_remotes[remote] .. local_path
	vim.cmd('tab split')
	vim.cmd('vertical diffsplit ' .. remote_path)
end

helper.keymap_lua_leader_n_ns('rexo', [[compareRemotes('exo')]])

vim.api.nvim_exec(
	[[
	augroup my_scp
		autocmd!
		autocmd BufNewFile,BufRead,BufLeave scp://* setlocal bufhidden=delete
	augroup END
	]],
	false
)
