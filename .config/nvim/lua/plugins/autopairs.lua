local plugin = {}

function plugin.config()
	require('nvim-autopairs').setup()
	require("nvim-autopairs.completion.compe").setup({
		map_cr = true, --  map <CR> on insert mode
		-- it will auto insert `(` after select function or method item
		map_complete = true
	})
end

return plugin
