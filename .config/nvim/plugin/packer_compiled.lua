-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/aaron/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/aaron/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/aaron/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/aaron/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/aaron/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\1\2¨\3\0\0\b\0\18\1\"4\0\0\0%\1\1\0>\0\2\0027\1\2\0%\2\3\0%\3\4\0>\1\3\0017\1\5\0%\2\6\0%\3\a\0>\1\3\0017\1\b\0%\2\3\0%\3\t\0>\1\3\0017\1\b\0%\2\6\0%\3\a\0>\1\3\0014\1\0\0%\2\n\0>\1\2\0027\2\v\0017\2\f\0023\3\16\0002\4\3\0\16\5\2\0%\6\14\0%\a\15\0>\5\3\0<\5\0\0:\4\17\3:\3\r\1G\0\1\0\ball\1\0\0\29Just testing: ${1:Stuff}\ttest\rsnippets\18parse_snippet\vparser\fluasnip\29require'luasnip'.jump(1)\20keymap_lua_s_ns\30require'luasnip'.jump(-1)\f<S-Tab>\20keymap_lua_i_nsLluasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'\n<Tab>\20keymap_expr_i_s\vhelper\frequire\3€€À™\4\0" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ale = {
    config = { "\27LJ\1\2\2\0\0\3\0\17\0\0274\0\0\0007\0\1\0003\1\4\0003\2\3\0:\2\5\1:\1\2\0004\0\0\0007\0\1\0003\1\b\0003\2\a\0:\2\5\0013\2\t\0:\2\n\0013\2\v\0:\2\f\0013\2\r\0:\2\14\1:\1\6\0004\0\0\0007\0\1\0'\1\1\0:\1\15\0004\0\0\0007\0\1\0'\1\1\0:\1\16\0G\0\1\0\22ale_sign_priority\27ale_virtualtext_cursor\tdart\1\2\0\0\fdartfmt\tjson\1\2\0\0\ajq\15javascript\1\2\0\0\rstandard\1\0\0\1\2\0\0\17php_cs_fixer\15ale_fixers\bphp\1\0\0\1\4\0\0\npsalm\nphpmd\bphp\16ale_linters\6g\bvim\0" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["editorconfig-vim"] = {
    config = { '\27LJ\1\2Z\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\3\0\0\18fugitive://.*\rscp://.*"EditorConfig_exclude_patterns\6g\bvim\0' },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2ª\a\0\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\3\0003\3\4\0:\3\5\0023\3\6\0:\3\a\2:\2\t\1>\0\2\1G\0\1\0\fkeymaps\1\0\0\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\v\fnoremap\2\18v <leader>ghrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\18n <leader>ghs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\18n <leader>ghR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\18n <leader>ghr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\18v <leader>ghsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\18n <leader>ghb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\18n <leader>ghp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\18n <leader>ghu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    config = { "\27LJ\1\2X\0\0\2\0\5\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\3\0%\1\4\0>\0\2\1G\0\1\0\24colorscheme gruvbox\bcmd\19gruvbox_italic\6g\bvim\0" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\1\2Ë\2\0\0\5\0\18\0(4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\1\4\0%\2\5\0%\3\6\0>\1\3\0017\1\4\0%\2\a\0%\3\b\0>\1\3\0017\1\4\0%\2\t\0%\3\n\0>\1\3\0017\1\v\0%\2\5\0%\3\6\0>\1\3\0017\1\v\0%\2\a\0%\3\b\0>\1\3\0017\1\v\0%\2\t\0%\3\n\0>\1\3\0014\1\f\0003\2\r\0003\3\15\0003\4\14\0:\4\16\3:\3\17\2>\1\2\1G\0\1\0\bmap\6h\1\0\0\1\0\1\tname\bHop\1\0\1\vprefix\r<leader>\22_registerPluginWk\27keymap_cmd_leader_v_ns\rHopChar2\ah2\rHopChar1\ah1\fHopWord\ahw\27keymap_cmd_leader_n_ns\vhelper\nsetup\bhop\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2¹\1\0\0\2\0\6\0\r4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\4\0004\0\0\0007\0\1\0)\1\2\0:\1\5\0G\0\1\0*indent_blankline_show_current_context$indent_blankline_use_treesitter\1\3\0\0\thelp\vpacker&indent_blankline_filetype_exclude\6g\bvim\0" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lightline.vim"] = {
    config = { "\27LJ\1\2¦\2\0\1\f\0\n\00184\1\0\0007\1\1\0017\1\2\1\16\2\0\0%\3\3\0>\1\3\2)\2\1\0)\3\1\0'\4\1\0\16\5\1\0'\6\1\0I\4\"€\14\0\2\0T\b\f€4\b\0\0007\b\1\b7\b\4\b\16\t\0\0\16\n\a\0%\v\5\0>\b\4\2\b\b\0\0T\b\2€)\2\1\0T\b\1€)\2\2\0\14\0\3\0T\b\f€4\b\0\0007\b\1\b7\b\4\b\16\t\0\0\16\n\a\0%\v\6\0>\b\4\2\b\b\0\0T\b\2€)\3\1\0T\b\1€)\3\2\0\15\0\2\0T\b\3€\15\0\3\0T\b\1€T\4\1€K\4Þ\15\0\2\0T\4\2€%\4\a\0T\5\5€\14\0\3\0T\4\2€%\4\b\0T\5\1€%\4\t\0H\4\2\0\5\6-\6+\16&modifiable\14&modified\17gettabwinvar\6$\17tabpagewinnr\afn\bvim\2¬\6\1\0\5\0!\00054\0\0\0007\0\1\0003\1\b\0003\2\6\0002\3\4\0003\4\3\0;\4\1\0033\4\4\0;\4\2\0033\4\5\0;\4\3\3:\3\a\2:\2\t\0013\2\f\0002\3\3\0003\4\n\0;\4\1\0033\4\v\0;\4\2\3:\3\r\0022\3\4\0003\4\14\0;\4\1\0033\4\15\0;\4\2\0033\4\16\0;\4\3\3:\3\a\2:\2\17\0013\2\18\0002\3\0\0:\3\a\2:\2\19\0013\2\21\0003\3\20\0:\3\t\0023\3\22\0:\3\17\2:\2\23\0013\2\24\0:\2\25\0013\2\26\0:\2\27\1:\1\2\0001\0\28\0005\0\29\0004\0\0\0007\0\30\0007\0\31\0%\1 \0)\2\1\0>\0\3\1G\0\1\0ƒ\1\t\t\t\t\tfunction! LightlineTablineModified(tabnr)\n\t\t\t\t\t\treturn luaeval('LightlineTablineModified')(a:tabnr)\n\t\t\t\t\tendfunction\n\t\t\t\t\14nvim_exec\bapi\29LightlineTablineModified\0\27tab_component_function\1\0\1\17tab_modified\29LightlineTablineModified\23component_function\1\0\1\14gitbranch\17FugitiveHead\btab\1\4\0\0\vtabnum\rfilename\17tab_modified\1\0\0\1\4\0\0\vtabnum\rfilename\17tab_modified\ftabline\1\0\0\rinactive\1\5\0\0\nspell\14gitbranch\17fileencoding\rfiletype\1\2\0\0\fpercent\1\2\0\0\rlineinfo\tleft\1\0\0\1\4\0\0\rreadonly\rfilename\rmodified\1\3\0\0\tmode\npaste\vactive\1\0\0\nright\1\0\0\1\5\0\0\nspell\14gitbranch\17fileencoding\rfiletype\1\2\0\0\fpercent\1\2\0\0\rlineinfo\14lightline\6g\bvim\0" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    after = { "nvim-lspconfig" },
    loaded = true,
    only_config = true
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2\1\0\0\2\0\5\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\0\2\0003\1\4\0>\0\2\1G\0\1\0\1\0\2\17map_complete\2\vmap_cr\2$nvim-autopairs.completion.compe\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2X\0\0\3\0\5\0\b4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0>\0\3\1G\0\1\0\1\0\2\vhsl_fn\2\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui", "nvim-dap-virtual-text" },
    loaded = true,
    only_config = true
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\1\2õ\2\0\0\5\0\19\0\0234\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\4\0003\3\3\0:\3\5\0023\3\a\0003\4\6\0:\4\b\3:\3\t\0023\3\n\0003\4\v\0:\4\f\3:\3\r\0023\3\14\0003\4\15\0:\4\f\3:\3\16\0023\3\17\0:\3\18\2>\1\2\1G\0\1\0\rfloating\1\0\0\ttray\1\2\0\0\trepl\1\0\3\vheight\3\n\rposition\vbottom\18open_on_start\2\fsidebar\relements\1\5\0\0\vscopes\16breakpoints\vstacks\fwatches\1\0\3\rposition\tleft\nwidth\3<\18open_on_start\2\rmappings\vexpand\1\0\3\topen\6o\vremove\6d\tedit\6e\1\2\0\0\t<CR>\nicons\1\0\0\1\0\2\14collapsed\bâ–¸\rexpanded\bâ–¾\nsetup\ndapui\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\0025\2\0\3\2\1\0\6+\0\0\0007\0\0\0+\1\1\0C\2\0\0=\0\1\1G\0\1\0\2À\1À\22keymap_b_cmd_n_ns<\2\0\3\2\1\0\6+\0\0\0007\0\0\0+\1\1\0C\2\0\0=\0\1\1G\0\1\0\2À\1À\29keymap_b_cmd_leader_n_ns5\2\0\3\2\1\0\6+\0\0\0007\0\0\0+\1\1\0C\2\0\0=\0\1\1G\0\1\0\2À\1À\22keymap_b_lua_n_ns<\2\0\3\2\1\0\6+\0\0\0007\0\0\0+\1\1\0C\2\0\0=\0\1\1G\0\1\0\2À\1À\29keymap_b_lua_leader_n_nsA\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_option\bapi\bvimÑ\n\1\2\14\0>\0o4\2\0\0%\3\1\0>\2\2\0021\3\2\0001\4\3\0001\5\4\0001\6\5\0001\a\6\0001\b\a\0\16\t\b\0%\n\b\0%\v\t\0>\t\3\1\16\t\5\0%\n\n\0%\v\v\0>\t\3\1\16\t\5\0%\n\f\0%\v\r\0>\t\3\1\16\t\5\0%\n\14\0%\v\15\0>\t\3\1\16\t\5\0%\n\16\0%\v\17\0>\t\3\1\16\t\6\0%\n\18\0%\v\19\0>\t\3\1\16\t\6\0%\n\20\0%\v\21\0>\t\3\1\16\t\6\0%\n\22\0%\v\23\0>\t\3\1\16\t\6\0%\n\24\0%\v\25\0>\t\3\1\16\t\5\0%\n\26\0%\v\27\0>\t\3\1\16\t\6\0%\n\28\0%\v\29\0>\t\3\1\16\t\5\0%\n\30\0%\v\31\0>\t\3\1\16\t\5\0%\n \0%\v!\0>\t\3\1\16\t\6\0%\n\"\0%\v#\0>\t\3\1\16\t\6\0%\n$\0%\v%\0>\t\3\1\16\t\4\0%\n&\0%\v'\0>\t\3\1\16\t\3\0%\n(\0%\v)\0>\t\3\1\16\t\4\0%\n*\0%\v+\0>\t\3\1\16\t\4\0%\n,\0%\v-\0>\t\3\1\16\t\5\0%\n.\0%\v/\0>\t\3\1\16\t\5\0%\n0\0%\v1\0>\t\3\0014\t2\0003\n3\0:\0014\n3\v8\0003\f5\0003\r6\0:\r7\f:\f9\v:\v:\n>\t\2\0014\t\0\0%\n;\0>\t\2\0027\t<\t3\n=\0>\t\2\0010\0\0€G\0\1\0\1\0\3\16use_lspsaga\2\16hint_prefix\tâ†’ \tbind\2\14on_attach\18lsp_signature\bmap\6l\1\0\0\6w\1\0\1\tname\14Workspace\1\0\1\tname\bLSP\vbuffer\1\0\1\vprefix\r<leader>\22_registerPluginWk9require('lspsaga.action').smart_scroll_with_saga(-1)\n<A-u>8require('lspsaga.action').smart_scroll_with_saga(1)\n<A-d>\31Lspsaga preview_definition\alp\19Lspsaga rename\alr\27Lspsaga signature_help\n<C-k>\24Lspsaga code_action\alc\29vim.lsp.buf.formatting()\alf%vim.lsp.diagnostic.set_loclist()\alq#vim.lsp.diagnostic.goto_next()\a]d#vim.lsp.diagnostic.goto_prev()\a[d/vim.lsp.diagnostic.show_line_diagnostics()\ale\29vim.lsp.buf.references()\agr\"vim.lsp.buf.type_definition()\alD=print(vim.inspect(vim.lsp.buf.list_workspace_folders()))\blwl*vim.lsp.buf.remove_workspace_folder()\blwr'vim.lsp.buf.add_workspace_folder()\blwa\24vim.lsp.buf.hover()\6K!vim.lsp.buf.implementation()\agi\29vim.lsp.buf.definition()\agd\30vim.lsp.buf.declaration()\agD\27v:lua.vim.lsp.omnifunc\romnifunc\0\0\0\0\0\0\vhelper\frequireÂ\4\1\0\f\0'\0>4\0\0\0%\1\1\0>\0\2\0021\1\2\0003\2\3\0004\3\4\0\16\4\2\0>\3\2\4T\6\5€6\b\a\0007\b\5\b3\t\6\0:\1\a\t>\b\2\1A\6\3\3N\6ù4\3\b\0007\3\t\0034\4\n\0007\4\v\4%\5\f\0>\3\3\0024\4\r\0007\4\14\4\16\5\3\0%\6\15\0>\4\3\0014\4\r\0007\4\14\4\16\5\3\0%\6\16\0>\4\3\0017\4\17\0007\4\5\0043\5\18\0:\1\a\0053\6\19\0:\6\20\0053\6$\0003\a\22\0003\b\21\0:\3\v\b:\b\23\a3\b\25\0003\t\24\0:\t\26\b:\b\27\a3\b\31\0004\t\b\0007\t\28\t7\t\29\t%\n\30\0)\v\2\0>\t\3\2:\t \b:\b!\a3\b\"\0:\b#\a:\a%\6:\6&\5>\4\2\1G\0\1\0\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\bcmd\1\2\0\0\24lua-language-server\1\0\0\16sumneko_lua\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\bvim\14on_attach\1\0\0\nsetup\vipairs\1\4\0\0\vdartls\rphpactor\vtexlab\0\14lspconfig\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2‚\2\0\0\5\0\15\0\0234\0\0\0%\1\1\0>\0\2\0027\1\2\0%\2\3\0%\3\4\0>\1\3\0017\1\2\0%\2\5\0%\3\6\0>\1\3\0017\1\2\0%\2\a\0%\3\b\0>\1\3\0014\1\t\0003\2\n\0003\3\f\0003\4\v\0:\4\r\3:\3\14\2>\1\2\1G\0\1\0\bmap\6b\1\0\0\1\0\1\tname\14Nvim Tree\1\0\1\vprefix\r<leader>\22_registerPluginWk\21NvimTreeFindFile\abf\20NvimTreeRefresh\abr\19NvimTreeToggle\abb\27keymap_cmd_leader_n_ns\vhelper\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2’\2\0\0\4\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0003\3\a\0:\3\b\2:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\1\2‘\a\0\0\5\0(\0,4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\24\0003\2\6\0003\3\3\0003\4\4\0:\4\5\3:\3\a\0023\3\b\0003\4\t\0:\4\n\0033\4\v\0:\4\f\0033\4\r\0:\4\14\0033\4\15\0:\4\16\3:\3\17\0023\3\18\0003\4\19\0:\4\20\0033\4\21\0:\4\22\3:\3\23\2:\2\25\1>\0\2\0014\0\26\0003\1\27\0003\2%\0003\3\28\0003\4\29\0:\4\30\0033\4\31\0:\4 \0033\4!\0:\4\"\0033\4#\0:\4$\3:\3&\2:\2'\1>\0\2\1G\0\1\0\bmap\6s\1\0\0\6F\1\0\1\tname\22Function backward\6f\1\0\1\tname\21Function forward\6A\1\0\1\tname\22Argument backward\6a\1\0\1\tname\21Argument forward\1\0\1\tname\tSwap\1\0\1\vprefix\r<leader>\22_registerPluginWk\16textobjects\1\0\0\tswap\18swap_previous\1\0\2\15<leader>sA\21@parameter.inner\15<leader>sF\20@function.outer\14swap_next\1\0\2\15<leader>sa\21@parameter.inner\15<leader>sf\20@function.outer\1\0\1\venable\2\tmove\22goto_previous_end\1\0\1\a[M\20@function.outer\24goto_previous_start\1\0\1\a[m\20@function.outer\18goto_next_end\1\0\1\a]M\20@function.outer\20goto_next_start\1\0\1\a]m\20@function.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\fkeymaps\1\0\a\aia\21@parameter.inner\aif\20@function.inner\aal\16@loop.outer\aaa\21@parameter.outer\ail\16@loop.inner\aaf\20@function.outer\aac\19@comment.outer\1\0\2\14lookahead\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\1\2H\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/telescope-dap.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\1\2H\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-dap.nvim", "telescope-fzf-native.nvim" },
    config = { "\27LJ\1\2†\b\0\0\a\0004\0W4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\6\0003\3\4\0003\4\3\0:\4\5\3:\3\a\2>\1\2\0014\1\0\0%\2\b\0>\1\2\0027\2\t\1%\3\n\0%\4\v\0>\2\3\0017\2\t\1%\3\f\0%\4\r\0>\2\3\0017\2\t\1%\3\14\0%\4\15\0>\2\3\0017\2\t\1%\3\16\0%\4\17\0>\2\3\0017\2\t\1%\3\18\0%\4\19\0>\2\3\0017\2\t\1%\3\20\0%\4\21\0>\2\3\0017\2\t\1%\3\22\0%\4\23\0>\2\3\0017\2\t\1%\3\24\0%\4\25\0>\2\3\0017\2\t\1%\3\26\0%\4\27\0>\2\3\0017\2\t\1%\3\28\0%\4\29\0>\2\3\0017\2\t\1%\3\30\0%\4\31\0>\2\3\0017\2\t\1%\3 \0%\4!\0>\2\3\0017\2\t\1%\3\"\0%\4#\0>\2\3\0017\2\t\1%\3$\0%\4%\0>\2\3\0017\2\t\1%\3&\0%\4'\0>\2\3\0014\2(\0003\3)\0003\0041\0003\5*\0003\6+\0:\6,\0053\6-\0:\6.\0053\6/\0:\0060\5:\0052\4:\0043\3>\2\2\1G\0\1\0\bmap\6f\1\0\0\6l\1\0\1\tname\bLSP\6c\1\0\1\tname\19Current Buffer\6g\1\0\1\tname\bGit\1\0\1\tname\14Telescope\1\0\1\vprefix\r<leader>\22_registerPluginWk\25Telescope treesitter\aft\24Telescope git_stash\bfgt\27Telescope git_bcommits\bfgb\26Telescope git_commits\bfgc\30Telescope lsp_definitions\bfld\"Telescope lsp_implementations\bfli#Telescope lsp_document_symbols\bfls\28Telescope lsp_refrences\bflr(Telescope current_buffer_fuzzy_find\bfcr\20Telescope marks\afm\22Telescope buffers\afb\27Telescope file_browser\afu\24Telescope live_grep\afr\24Telescope git_files\bfgf\25Telescope find_files\aff\27keymap_cmd_leader_n_ns\vhelper\15extensions\1\0\0\bfzf\1\0\0\1\0\4\28override_generic_sorter\1\14case_mode\15smart_case\25override_file_sorter\1\nfuzzy\2\nsetup\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\2ð\1\0\0\5\0\14\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\0014\0\0\0%\1\4\0>\0\2\0027\1\5\0%\2\6\0%\3\a\0>\1\3\0014\1\b\0003\2\t\0003\3\v\0003\4\n\0:\4\f\3:\3\r\2>\1\2\1G\0\1\0\bmap\6o\1\0\0\1\0\1\tname\fTrouble\1\0\1\vprefix\r<leader>\22_registerPluginWk\20Trouble loclist\aol\27keymap_cmd_leader_n_ns\vhelper\1\0\1\tmode\floclist\nsetup\ftrouble\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "Gpull", "Gstatus", "Glog", "Gdiffsplit", "Gwrite", "Gread", "GRename", "GMove" },
    loaded = false,
    needs_bufread = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-polyglot"] = {
    loaded = true,
    needs_bufread = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["which-key.nvim"] = {
    after = { "hop.nvim", "nvim-treesitter-textobjects", "telescope.nvim", "nvim-tree.lua", "nvim-lspconfig", "trouble.nvim" },
    loaded = true,
    only_config = true
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-dap-virtual-text
time([[Setup for nvim-dap-virtual-text]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\3\0\0054\0\0\0007\0\1\0)\1\2\0:\1\2\0G\0\1\0\21dap_virtual_text\6g\bvim\0", "setup", "nvim-dap-virtual-text")
time([[Setup for nvim-dap-virtual-text]], false)
-- Setup for: vim-polyglot
time([[Setup for vim-polyglot]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\3\0\0054\0\0\0007\0\1\0002\1\0\0:\1\2\0G\0\1\0\22polyglot_disabled\6g\bvim\0", "setup", "vim-polyglot")
time([[Setup for vim-polyglot]], false)
time([[packadd for vim-polyglot]], true)
vim.cmd [[packadd vim-polyglot]]
time([[packadd for vim-polyglot]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2`\0\0\2\0\4\0\t4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0'\1\0\0:\1\3\0G\0\1\0\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\6g\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2’\2\0\0\4\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0003\3\a\0:\3\b\2:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: editorconfig-vim
time([[Config for editorconfig-vim]], true)
try_loadstring('\27LJ\1\2Z\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\3\0\0\18fugitive://.*\rscp://.*"EditorConfig_exclude_patterns\6g\bvim\0', "config", "editorconfig-vim")
time([[Config for editorconfig-vim]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
try_loadstring("\27LJ\1\2X\0\0\2\0\5\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\3\0%\1\4\0>\0\2\1G\0\1\0\24colorscheme gruvbox\bcmd\19gruvbox_italic\6g\bvim\0", "config", "gruvbox")
time([[Config for gruvbox]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2¹\1\0\0\2\0\6\0\r4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\4\0004\0\0\0007\0\1\0)\1\2\0:\1\5\0G\0\1\0*indent_blankline_show_current_context$indent_blankline_use_treesitter\1\3\0\0\thelp\vpacker&indent_blankline_filetype_exclude\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: ale
time([[Config for ale]], true)
try_loadstring("\27LJ\1\2\2\0\0\3\0\17\0\0274\0\0\0007\0\1\0003\1\4\0003\2\3\0:\2\5\1:\1\2\0004\0\0\0007\0\1\0003\1\b\0003\2\a\0:\2\5\0013\2\t\0:\2\n\0013\2\v\0:\2\f\0013\2\r\0:\2\14\1:\1\6\0004\0\0\0007\0\1\0'\1\1\0:\1\15\0004\0\0\0007\0\1\0'\1\1\0:\1\16\0G\0\1\0\22ale_sign_priority\27ale_virtualtext_cursor\tdart\1\2\0\0\fdartfmt\tjson\1\2\0\0\ajq\15javascript\1\2\0\0\rstandard\1\0\0\1\2\0\0\17php_cs_fixer\15ale_fixers\bphp\1\0\0\1\4\0\0\npsalm\nphpmd\bphp\16ale_linters\6g\bvim\0", "config", "ale")
time([[Config for ale]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\1\2‚\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\vsource\1\0\4\fluasnip\2\tcalc\2\rnvim_lsp\2\tpath\2\1\0\2\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\2X\0\0\3\0\5\0\b4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0>\0\3\1G\0\1\0\1\0\2\vhsl_fn\2\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\1\2í\a\0\0\a\0+\0O4\0\0\0%\1\1\0>\0\2\0027\1\2\0%\2\3\0%\3\4\0>\1\3\0017\1\2\0%\2\5\0%\3\6\0>\1\3\0017\1\2\0%\2\a\0%\3\b\0>\1\3\0017\1\2\0%\2\t\0%\3\n\0>\1\3\0017\1\2\0%\2\v\0%\3\f\0>\1\3\0017\1\2\0%\2\r\0%\3\14\0>\1\3\0017\1\2\0%\2\15\0%\3\16\0>\1\3\0017\1\2\0%\2\17\0%\3\18\0>\1\3\0017\1\2\0%\2\19\0%\3\20\0>\1\3\0017\1\2\0%\2\21\0%\3\22\0>\1\3\0017\1\2\0%\2\23\0%\3\24\0>\1\3\0017\1\2\0%\2\25\0%\3\26\0>\1\3\0014\1\0\0%\2\27\0>\1\2\0027\2\28\0013\3\30\0002\4\3\0004\5\31\0007\5 \5%\6!\0>\5\2\2%\6\"\0$\5\6\5;\5\1\4:\4#\3:\3\29\0027\2$\0012\3\3\0003\4%\0004\5&\0007\5'\0057\5(\5>\5\1\2%\6)\0$\5\6\5:\5*\4;\4\1\3:\3\29\2G\0\1\0\20localSourceRoot\6/\vgetcwd\afn\bvim\1\0\5\tport\3¨F\tname\22Listen for Xdebug\frequest\vlaunch\ttype\bphp\21serverSourceRoot\19/var/www/html/\19configurations\targs7/.local/share/dap/vscode-php-debug/out/phpDebug.js\tHOME\vgetenv\aos\1\0\2\fcommand\tnode\ttype\15executable\bphp\radapters\bdap\24require'dap'.down()\f<C-F10>\22require'dap'.up()\n<F10>$require'dap'.list_breakpoints()\t<F9>7require'dap'.set_exception_breakpoints('uncaught')\v<C-F8>%require'dap'.toggle_breakpoint()\t<F8>!require'dap'.run_to_cursor()\t<F7>\24require'dap'.stop()\t<F6>\28require'dap'.continue()\t<F5>\28require'dap'.step_out()\t<F4>\29require'dap'.step_into()\t<F3>\29require'dap'.step_over()\t<F2>\31require'dap'.repl.toggle()\t<F1>\20keymap_lua_n_ns\vhelper\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\1\2ñ\1\0\0\4\0\r\0\0174\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\4\0003\3\3\0:\3\5\2:\2\a\0013\2\t\0003\3\b\0:\3\5\2:\2\n\0013\2\v\0:\2\f\1>\0\2\1G\0\1\0\23code_action_prompt\1\0\1\venable\1\23rename_action_keys\1\0\1\texec\t<CR>\1\4\0\0\6q\n<Esc>\n<C-c>\21code_action_keys\1\0\0\tquit\1\0\1\texec\t<CR>\1\4\0\0\6q\n<Esc>\n<C-c>\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: lightline.vim
time([[Config for lightline.vim]], true)
try_loadstring("\27LJ\1\2¦\2\0\1\f\0\n\00184\1\0\0007\1\1\0017\1\2\1\16\2\0\0%\3\3\0>\1\3\2)\2\1\0)\3\1\0'\4\1\0\16\5\1\0'\6\1\0I\4\"€\14\0\2\0T\b\f€4\b\0\0007\b\1\b7\b\4\b\16\t\0\0\16\n\a\0%\v\5\0>\b\4\2\b\b\0\0T\b\2€)\2\1\0T\b\1€)\2\2\0\14\0\3\0T\b\f€4\b\0\0007\b\1\b7\b\4\b\16\t\0\0\16\n\a\0%\v\6\0>\b\4\2\b\b\0\0T\b\2€)\3\1\0T\b\1€)\3\2\0\15\0\2\0T\b\3€\15\0\3\0T\b\1€T\4\1€K\4Þ\15\0\2\0T\4\2€%\4\a\0T\5\5€\14\0\3\0T\4\2€%\4\b\0T\5\1€%\4\t\0H\4\2\0\5\6-\6+\16&modifiable\14&modified\17gettabwinvar\6$\17tabpagewinnr\afn\bvim\2¬\6\1\0\5\0!\00054\0\0\0007\0\1\0003\1\b\0003\2\6\0002\3\4\0003\4\3\0;\4\1\0033\4\4\0;\4\2\0033\4\5\0;\4\3\3:\3\a\2:\2\t\0013\2\f\0002\3\3\0003\4\n\0;\4\1\0033\4\v\0;\4\2\3:\3\r\0022\3\4\0003\4\14\0;\4\1\0033\4\15\0;\4\2\0033\4\16\0;\4\3\3:\3\a\2:\2\17\0013\2\18\0002\3\0\0:\3\a\2:\2\19\0013\2\21\0003\3\20\0:\3\t\0023\3\22\0:\3\17\2:\2\23\0013\2\24\0:\2\25\0013\2\26\0:\2\27\1:\1\2\0001\0\28\0005\0\29\0004\0\0\0007\0\30\0007\0\31\0%\1 \0)\2\1\0>\0\3\1G\0\1\0ƒ\1\t\t\t\t\tfunction! LightlineTablineModified(tabnr)\n\t\t\t\t\t\treturn luaeval('LightlineTablineModified')(a:tabnr)\n\t\t\t\t\tendfunction\n\t\t\t\t\14nvim_exec\bapi\29LightlineTablineModified\0\27tab_component_function\1\0\1\17tab_modified\29LightlineTablineModified\23component_function\1\0\1\14gitbranch\17FugitiveHead\btab\1\4\0\0\vtabnum\rfilename\17tab_modified\1\0\0\1\4\0\0\vtabnum\rfilename\17tab_modified\ftabline\1\0\0\rinactive\1\5\0\0\nspell\14gitbranch\17fileencoding\rfiletype\1\2\0\0\fpercent\1\2\0\0\rlineinfo\tleft\1\0\0\1\4\0\0\rreadonly\rfilename\rmodified\1\3\0\0\tmode\npaste\vactive\1\0\0\nright\1\0\0\1\5\0\0\nspell\14gitbranch\17fileencoding\rfiletype\1\2\0\0\fpercent\1\2\0\0\rlineinfo\14lightline\6g\bvim\0", "config", "lightline.vim")
time([[Config for lightline.vim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\1\2§\1\0\0\4\0\n\0\0154\0\0\0%\1\1\0>\0\2\0027\1\2\0002\2\0\0>\1\2\0017\1\3\0003\2\5\0003\3\4\0:\3\6\0023\3\a\0:\3\b\0023\3\t\0>\1\3\1G\0\1\0\1\0\1\vprefix\r<leader>\6r\1\0\1\tname\25Compare Remote Files\6t\1\0\0\1\0\1\tname\bTab\rregister\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2ª\a\0\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\3\0003\3\4\0:\3\5\0023\3\6\0:\3\a\2:\2\t\1>\0\2\1G\0\1\0\fkeymaps\1\0\0\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\v\fnoremap\2\18v <leader>ghrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\18n <leader>ghs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\18n <leader>ghR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\18n <leader>ghr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\18v <leader>ghsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\18n <leader>ghb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\18n <leader>ghp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\18n <leader>ghu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\1\2¨\3\0\0\b\0\18\1\"4\0\0\0%\1\1\0>\0\2\0027\1\2\0%\2\3\0%\3\4\0>\1\3\0017\1\5\0%\2\6\0%\3\a\0>\1\3\0017\1\b\0%\2\3\0%\3\t\0>\1\3\0017\1\b\0%\2\6\0%\3\a\0>\1\3\0014\1\0\0%\2\n\0>\1\2\0027\2\v\0017\2\f\0023\3\16\0002\4\3\0\16\5\2\0%\6\14\0%\a\15\0>\5\3\0<\5\0\0:\4\17\3:\3\r\1G\0\1\0\ball\1\0\0\29Just testing: ${1:Stuff}\ttest\rsnippets\18parse_snippet\vparser\fluasnip\29require'luasnip'.jump(1)\20keymap_lua_s_ns\30require'luasnip'.jump(-1)\f<S-Tab>\20keymap_lua_i_nsLluasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'\n<Tab>\20keymap_expr_i_s\vhelper\frequire\3€€À™\4\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-dap-virtual-text ]]
vim.cmd [[ packadd nvim-dap-ui ]]

-- Config for: nvim-dap-ui
try_loadstring("\27LJ\1\2õ\2\0\0\5\0\19\0\0234\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\4\0003\3\3\0:\3\5\0023\3\a\0003\4\6\0:\4\b\3:\3\t\0023\3\n\0003\4\v\0:\4\f\3:\3\r\0023\3\14\0003\4\15\0:\4\f\3:\3\16\0023\3\17\0:\3\18\2>\1\2\1G\0\1\0\rfloating\1\0\0\ttray\1\2\0\0\trepl\1\0\3\vheight\3\n\rposition\vbottom\18open_on_start\2\fsidebar\relements\1\5\0\0\vscopes\16breakpoints\vstacks\fwatches\1\0\3\rposition\tleft\nwidth\3<\18open_on_start\2\rmappings\vexpand\1\0\3\topen\6o\vremove\6d\tedit\6e\1\2\0\0\t<CR>\nicons\1\0\0\1\0\2\14collapsed\bâ–¸\rexpanded\bâ–¾\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")

vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\1\2\1\0\0\2\0\5\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\0\2\0003\1\4\0>\0\2\1G\0\1\0\1\0\2\17map_complete\2\vmap_cr\2$nvim-autopairs.completion.compe\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

vim.cmd [[ packadd telescope.nvim ]]

-- Config for: telescope.nvim
try_loadstring("\27LJ\1\2†\b\0\0\a\0004\0W4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\6\0003\3\4\0003\4\3\0:\4\5\3:\3\a\2>\1\2\0014\1\0\0%\2\b\0>\1\2\0027\2\t\1%\3\n\0%\4\v\0>\2\3\0017\2\t\1%\3\f\0%\4\r\0>\2\3\0017\2\t\1%\3\14\0%\4\15\0>\2\3\0017\2\t\1%\3\16\0%\4\17\0>\2\3\0017\2\t\1%\3\18\0%\4\19\0>\2\3\0017\2\t\1%\3\20\0%\4\21\0>\2\3\0017\2\t\1%\3\22\0%\4\23\0>\2\3\0017\2\t\1%\3\24\0%\4\25\0>\2\3\0017\2\t\1%\3\26\0%\4\27\0>\2\3\0017\2\t\1%\3\28\0%\4\29\0>\2\3\0017\2\t\1%\3\30\0%\4\31\0>\2\3\0017\2\t\1%\3 \0%\4!\0>\2\3\0017\2\t\1%\3\"\0%\4#\0>\2\3\0017\2\t\1%\3$\0%\4%\0>\2\3\0017\2\t\1%\3&\0%\4'\0>\2\3\0014\2(\0003\3)\0003\0041\0003\5*\0003\6+\0:\6,\0053\6-\0:\6.\0053\6/\0:\0060\5:\0052\4:\0043\3>\2\2\1G\0\1\0\bmap\6f\1\0\0\6l\1\0\1\tname\bLSP\6c\1\0\1\tname\19Current Buffer\6g\1\0\1\tname\bGit\1\0\1\tname\14Telescope\1\0\1\vprefix\r<leader>\22_registerPluginWk\25Telescope treesitter\aft\24Telescope git_stash\bfgt\27Telescope git_bcommits\bfgb\26Telescope git_commits\bfgc\30Telescope lsp_definitions\bfld\"Telescope lsp_implementations\bfli#Telescope lsp_document_symbols\bfls\28Telescope lsp_refrences\bflr(Telescope current_buffer_fuzzy_find\bfcr\20Telescope marks\afm\22Telescope buffers\afb\27Telescope file_browser\afu\24Telescope live_grep\afr\24Telescope git_files\bfgf\25Telescope find_files\aff\27keymap_cmd_leader_n_ns\vhelper\15extensions\1\0\0\bfzf\1\0\0\1\0\4\28override_generic_sorter\1\14case_mode\15smart_case\25override_file_sorter\1\nfuzzy\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")

vim.cmd [[ packadd telescope-fzf-native.nvim ]]

-- Config for: telescope-fzf-native.nvim
try_loadstring("\27LJ\1\2H\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")

vim.cmd [[ packadd telescope-dap.nvim ]]

-- Config for: telescope-dap.nvim
try_loadstring("\27LJ\1\2H\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")

vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\1\0025\2\0\3\2\1\0\6+\0\0\0007\0\0\0+\1\1\0C\2\0\0=\0\1\1G\0\1\0\2À\1À\22keymap_b_cmd_n_ns<\2\0\3\2\1\0\6+\0\0\0007\0\0\0+\1\1\0C\2\0\0=\0\1\1G\0\1\0\2À\1À\29keymap_b_cmd_leader_n_ns5\2\0\3\2\1\0\6+\0\0\0007\0\0\0+\1\1\0C\2\0\0=\0\1\1G\0\1\0\2À\1À\22keymap_b_lua_n_ns<\2\0\3\2\1\0\6+\0\0\0007\0\0\0+\1\1\0C\2\0\0=\0\1\1G\0\1\0\2À\1À\29keymap_b_lua_leader_n_nsA\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimA\2\0\3\1\3\0\a4\0\0\0007\0\1\0007\0\2\0+\1\0\0C\2\0\0=\0\1\1G\0\1\0\1À\24nvim_buf_set_option\bapi\bvimÑ\n\1\2\14\0>\0o4\2\0\0%\3\1\0>\2\2\0021\3\2\0001\4\3\0001\5\4\0001\6\5\0001\a\6\0001\b\a\0\16\t\b\0%\n\b\0%\v\t\0>\t\3\1\16\t\5\0%\n\n\0%\v\v\0>\t\3\1\16\t\5\0%\n\f\0%\v\r\0>\t\3\1\16\t\5\0%\n\14\0%\v\15\0>\t\3\1\16\t\5\0%\n\16\0%\v\17\0>\t\3\1\16\t\6\0%\n\18\0%\v\19\0>\t\3\1\16\t\6\0%\n\20\0%\v\21\0>\t\3\1\16\t\6\0%\n\22\0%\v\23\0>\t\3\1\16\t\6\0%\n\24\0%\v\25\0>\t\3\1\16\t\5\0%\n\26\0%\v\27\0>\t\3\1\16\t\6\0%\n\28\0%\v\29\0>\t\3\1\16\t\5\0%\n\30\0%\v\31\0>\t\3\1\16\t\5\0%\n \0%\v!\0>\t\3\1\16\t\6\0%\n\"\0%\v#\0>\t\3\1\16\t\6\0%\n$\0%\v%\0>\t\3\1\16\t\4\0%\n&\0%\v'\0>\t\3\1\16\t\3\0%\n(\0%\v)\0>\t\3\1\16\t\4\0%\n*\0%\v+\0>\t\3\1\16\t\4\0%\n,\0%\v-\0>\t\3\1\16\t\5\0%\n.\0%\v/\0>\t\3\1\16\t\5\0%\n0\0%\v1\0>\t\3\0014\t2\0003\n3\0:\0014\n3\v8\0003\f5\0003\r6\0:\r7\f:\f9\v:\v:\n>\t\2\0014\t\0\0%\n;\0>\t\2\0027\t<\t3\n=\0>\t\2\0010\0\0€G\0\1\0\1\0\3\16use_lspsaga\2\16hint_prefix\tâ†’ \tbind\2\14on_attach\18lsp_signature\bmap\6l\1\0\0\6w\1\0\1\tname\14Workspace\1\0\1\tname\bLSP\vbuffer\1\0\1\vprefix\r<leader>\22_registerPluginWk9require('lspsaga.action').smart_scroll_with_saga(-1)\n<A-u>8require('lspsaga.action').smart_scroll_with_saga(1)\n<A-d>\31Lspsaga preview_definition\alp\19Lspsaga rename\alr\27Lspsaga signature_help\n<C-k>\24Lspsaga code_action\alc\29vim.lsp.buf.formatting()\alf%vim.lsp.diagnostic.set_loclist()\alq#vim.lsp.diagnostic.goto_next()\a]d#vim.lsp.diagnostic.goto_prev()\a[d/vim.lsp.diagnostic.show_line_diagnostics()\ale\29vim.lsp.buf.references()\agr\"vim.lsp.buf.type_definition()\alD=print(vim.inspect(vim.lsp.buf.list_workspace_folders()))\blwl*vim.lsp.buf.remove_workspace_folder()\blwr'vim.lsp.buf.add_workspace_folder()\blwa\24vim.lsp.buf.hover()\6K!vim.lsp.buf.implementation()\agi\29vim.lsp.buf.definition()\agd\30vim.lsp.buf.declaration()\agD\27v:lua.vim.lsp.omnifunc\romnifunc\0\0\0\0\0\0\vhelper\frequireÂ\4\1\0\f\0'\0>4\0\0\0%\1\1\0>\0\2\0021\1\2\0003\2\3\0004\3\4\0\16\4\2\0>\3\2\4T\6\5€6\b\a\0007\b\5\b3\t\6\0:\1\a\t>\b\2\1A\6\3\3N\6ù4\3\b\0007\3\t\0034\4\n\0007\4\v\4%\5\f\0>\3\3\0024\4\r\0007\4\14\4\16\5\3\0%\6\15\0>\4\3\0014\4\r\0007\4\14\4\16\5\3\0%\6\16\0>\4\3\0017\4\17\0007\4\5\0043\5\18\0:\1\a\0053\6\19\0:\6\20\0053\6$\0003\a\22\0003\b\21\0:\3\v\b:\b\23\a3\b\25\0003\t\24\0:\t\26\b:\b\27\a3\b\31\0004\t\b\0007\t\28\t7\t\29\t%\n\30\0)\v\2\0>\t\3\2:\t \b:\b!\a3\b\"\0:\b#\a:\a%\6:\6&\5>\4\2\1G\0\1\0\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\bcmd\1\2\0\0\24lua-language-server\1\0\0\16sumneko_lua\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\bvim\14on_attach\1\0\0\nsetup\vipairs\1\4\0\0\vdartls\rphpactor\vtexlab\0\14lspconfig\frequire\0", "config", "nvim-lspconfig")

vim.cmd [[ packadd trouble.nvim ]]

-- Config for: trouble.nvim
try_loadstring("\27LJ\1\2ð\1\0\0\5\0\14\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\0014\0\0\0%\1\4\0>\0\2\0027\1\5\0%\2\6\0%\3\a\0>\1\3\0014\1\b\0003\2\t\0003\3\v\0003\4\n\0:\4\f\3:\3\r\2>\1\2\1G\0\1\0\bmap\6o\1\0\0\1\0\1\tname\fTrouble\1\0\1\vprefix\r<leader>\22_registerPluginWk\20Trouble loclist\aol\27keymap_cmd_leader_n_ns\vhelper\1\0\1\tmode\floclist\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")

vim.cmd [[ packadd nvim-treesitter-textobjects ]]

-- Config for: nvim-treesitter-textobjects
try_loadstring("\27LJ\1\2‘\a\0\0\5\0(\0,4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\24\0003\2\6\0003\3\3\0003\4\4\0:\4\5\3:\3\a\0023\3\b\0003\4\t\0:\4\n\0033\4\v\0:\4\f\0033\4\r\0:\4\14\0033\4\15\0:\4\16\3:\3\17\0023\3\18\0003\4\19\0:\4\20\0033\4\21\0:\4\22\3:\3\23\2:\2\25\1>\0\2\0014\0\26\0003\1\27\0003\2%\0003\3\28\0003\4\29\0:\4\30\0033\4\31\0:\4 \0033\4!\0:\4\"\0033\4#\0:\4$\3:\3&\2:\2'\1>\0\2\1G\0\1\0\bmap\6s\1\0\0\6F\1\0\1\tname\22Function backward\6f\1\0\1\tname\21Function forward\6A\1\0\1\tname\22Argument backward\6a\1\0\1\tname\21Argument forward\1\0\1\tname\tSwap\1\0\1\vprefix\r<leader>\22_registerPluginWk\16textobjects\1\0\0\tswap\18swap_previous\1\0\2\15<leader>sA\21@parameter.inner\15<leader>sF\20@function.outer\14swap_next\1\0\2\15<leader>sa\21@parameter.inner\15<leader>sf\20@function.outer\1\0\1\venable\2\tmove\22goto_previous_end\1\0\1\a[M\20@function.outer\24goto_previous_start\1\0\1\a[m\20@function.outer\18goto_next_end\1\0\1\a]M\20@function.outer\20goto_next_start\1\0\1\a]m\20@function.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\fkeymaps\1\0\a\aia\21@parameter.inner\aif\20@function.inner\aal\16@loop.outer\aaa\21@parameter.outer\ail\16@loop.inner\aaf\20@function.outer\aac\19@comment.outer\1\0\2\14lookahead\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")

vim.cmd [[ packadd nvim-tree.lua ]]

-- Config for: nvim-tree.lua
try_loadstring("\27LJ\1\2‚\2\0\0\5\0\15\0\0234\0\0\0%\1\1\0>\0\2\0027\1\2\0%\2\3\0%\3\4\0>\1\3\0017\1\2\0%\2\5\0%\3\6\0>\1\3\0017\1\2\0%\2\a\0%\3\b\0>\1\3\0014\1\t\0003\2\n\0003\3\f\0003\4\v\0:\4\r\3:\3\14\2>\1\2\1G\0\1\0\bmap\6b\1\0\0\1\0\1\tname\14Nvim Tree\1\0\1\vprefix\r<leader>\22_registerPluginWk\21NvimTreeFindFile\abf\20NvimTreeRefresh\abr\19NvimTreeToggle\abb\27keymap_cmd_leader_n_ns\vhelper\frequire\0", "config", "nvim-tree.lua")

vim.cmd [[ packadd hop.nvim ]]

-- Config for: hop.nvim
try_loadstring("\27LJ\1\2Ë\2\0\0\5\0\18\0(4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\1\4\0%\2\5\0%\3\6\0>\1\3\0017\1\4\0%\2\a\0%\3\b\0>\1\3\0017\1\4\0%\2\t\0%\3\n\0>\1\3\0017\1\v\0%\2\5\0%\3\6\0>\1\3\0017\1\v\0%\2\a\0%\3\b\0>\1\3\0017\1\v\0%\2\t\0%\3\n\0>\1\3\0014\1\f\0003\2\r\0003\3\15\0003\4\14\0:\4\16\3:\3\17\2>\1\2\1G\0\1\0\bmap\6h\1\0\0\1\0\1\tname\bHop\1\0\1\vprefix\r<leader>\22_registerPluginWk\27keymap_cmd_leader_v_ns\rHopChar2\ah2\rHopChar1\ah1\fHopWord\ahw\27keymap_cmd_leader_n_ns\vhelper\nsetup\bhop\frequire\0", "config", "hop.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":GRename") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file GRename lua require("packer.load")({'vim-fugitive'}, { cmd = "GRename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Glog") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Glog lua require("packer.load")({'vim-fugitive'}, { cmd = "Glog", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Gstatus") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Gstatus lua require("packer.load")({'vim-fugitive'}, { cmd = "Gstatus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Gread") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Gread lua require("packer.load")({'vim-fugitive'}, { cmd = "Gread", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Gpull") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Gpull lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpull", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Gdiffsplit") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Gdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Git") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":GMove") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file GMove lua require("packer.load")({'vim-fugitive'}, { cmd = "GMove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Gwrite") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Gwrite lua require("packer.load")({'vim-fugitive'}, { cmd = "Gwrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
