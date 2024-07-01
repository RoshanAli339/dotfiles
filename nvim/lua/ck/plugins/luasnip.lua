return {
	"L3MON4D3/LuaSnip",
	event = "LspAttach",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")
		local keys = vim.keymap

		keys.set({ "i", "s" }, "<A-k>", function()
			ls.jump(1)
		end, { silent = true })
		keys.set({ "i", "s" }, "<A-j>", function()
			ls.jump(-1)
		end, { silent = true })
		keys.set({ "i", "s" }, "<A-e>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
	end,
	init = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
		require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "./snippets" } })
	end,
}
