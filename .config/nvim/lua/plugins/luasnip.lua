local plugin = {}

local function showIfUsed(args, text)
	local result = args[1][1] == '' and '' or text
	print(vim.inspect(args[3]))
	return result
end


function plugin.config()
	local helper = require'helper'

	helper.keymap_expr_i_s('<Tab>',
		[[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']])
	helper.keymap_lua_i_ns('<S-Tab>', [[require'luasnip'.jump(-1)]])

	helper.keymap_lua_s_ns('<Tab>', [[require'luasnip'.jump(1)]])
	helper.keymap_lua_s_ns('<S-Tab>', [[require'luasnip'.jump(-1)]])

	helper.keymap_expr_i_s('<C-E>', [[luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']])
	helper.keymap_expr_s_s('<C-E>', [[luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']])

	helper.keymap_lua_leader_n_ns('i', [[require'luasnip'.unlink_current()]])

	local ls = require'luasnip'

	ls.config.set_config{
		updateevents = 'TextChanged,TextChangedI'
	}

	local parse = ls.parser.parse_snippet
	local s = ls.snippet
	local sn = ls.snippet_node
	local t = ls.text_node
	local i = ls.insert_node
	local f = ls.function_node
	local c = ls.choice_node
	local d = ls.dynamic_node

	ls.snippets = {
		all = {
			parse(
				'test', 'Just testing: ${1:Stuff}'
			)
		},
		php = {
			-- [private] function $2() [use ($3)] $4{
			--     $0
			-- }
			s('function', {
				c(1, {
					t('public'),
					t('private'),
					t('protected'),
				}),
				t(' function '), i(2), t('('), i(3), t(') '),
				f(showIfUsed, {4}, 'use ('),
				i(4),
				f(showIfUsed, {4}, ') '),
				c(5, {
					t({'', '{', '\t'}),
					t({'{', '\t'}),
				}),
				i(0),
				t({'', '}'})
			})
		}
	}
end

return plugin
