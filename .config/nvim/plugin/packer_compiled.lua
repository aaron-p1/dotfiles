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
    config = { "require'plugins.luasnip'.config()" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ale = {
    config = { "require'plugins.ale'.config()" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["editorconfig-vim"] = {
    config = { "require'plugins.editorconfig'.config()" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "require'plugins.gitsigns'.config()" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    config = { "require'plugins.gruvbox'.config()" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["hop.nvim"] = {
    config = { "require'plugins.hop'.config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require'plugins.indent-blankline'.config()" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lightline.vim"] = {
    config = { "require'plugins.lightline'.config()" },
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
    config = { "require'plugins.autopairs'.config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require'plugins.colorizer'.config()" },
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
    config = { "require'plugins.dap-ui'.config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "require'plugins.dap-virtual-text'.config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    config = { "require'plugins.lspconfig'.config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "require'plugins.tree'.config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require'plugins.treesitter'.config()" },
    loaded = true,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "require'plugins.treesitter-textobjects'.config()" },
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
    config = { "require'plugins.telescope-dap'.config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/telescope-dap.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "require'plugins.telescope-fzf-native'.config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-dap.nvim", "telescope-fzf-native.nvim" },
    config = { "require'plugins.telescope'.config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/aaron/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "require'plugins.trouble'.config()" },
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
    path = "/home/aaron/.local/share/nvim/site/pack/packer/start/vim-polyglot"
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
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
require'plugins.tree'.setup()
time([[Setup for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require'plugins.treesitter'.config()
time([[Config for nvim-treesitter]], false)
-- Config for: editorconfig-vim
time([[Config for editorconfig-vim]], true)
require'plugins.editorconfig'.config()
time([[Config for editorconfig-vim]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
require'plugins.gruvbox'.config()
time([[Config for gruvbox]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require'plugins.indent-blankline'.config()
time([[Config for indent-blankline.nvim]], false)
-- Config for: ale
time([[Config for ale]], true)
require'plugins.ale'.config()
time([[Config for ale]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
require'plugins.compe'.config()
time([[Config for nvim-compe]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require'plugins.colorizer'.config()
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require'plugins.dap'.config()
time([[Config for nvim-dap]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require'plugins.lspsaga'.config()
time([[Config for lspsaga.nvim]], false)
-- Config for: lightline.vim
time([[Config for lightline.vim]], true)
require'plugins.lightline'.config()
time([[Config for lightline.vim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require'plugins.which-key'.config()
time([[Config for which-key.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require'plugins.gitsigns'.config()
time([[Config for gitsigns.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require'plugins.luasnip'.config()
time([[Config for LuaSnip]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-dap-virtual-text ]]

-- Config for: nvim-dap-virtual-text
require'plugins.dap-virtual-text'.config()

vim.cmd [[ packadd nvim-dap-ui ]]

-- Config for: nvim-dap-ui
require'plugins.dap-ui'.config()

vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
require'plugins.autopairs'.config()

vim.cmd [[ packadd telescope.nvim ]]

-- Config for: telescope.nvim
require'plugins.telescope'.config()

vim.cmd [[ packadd telescope-fzf-native.nvim ]]

-- Config for: telescope-fzf-native.nvim
require'plugins.telescope-fzf-native'.config()

vim.cmd [[ packadd telescope-dap.nvim ]]

-- Config for: telescope-dap.nvim
require'plugins.telescope-dap'.config()

vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
require'plugins.lspconfig'.config()

vim.cmd [[ packadd trouble.nvim ]]

-- Config for: trouble.nvim
require'plugins.trouble'.config()

vim.cmd [[ packadd nvim-treesitter-textobjects ]]

-- Config for: nvim-treesitter-textobjects
require'plugins.treesitter-textobjects'.config()

vim.cmd [[ packadd nvim-tree.lua ]]

-- Config for: nvim-tree.lua
require'plugins.tree'.config()

vim.cmd [[ packadd hop.nvim ]]

-- Config for: hop.nvim
require'plugins.hop'.config()

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
