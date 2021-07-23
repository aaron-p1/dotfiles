local plugin = {}

function plugin.config()
	local helper = require'helper'

	helper.keymap_expr_i_s('<Tab>',
		[[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']])
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

return plugin
