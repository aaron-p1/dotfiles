local plugin = {}

function plugin.config()
	require('telescope').load_extension('fzf')
end

return plugin
