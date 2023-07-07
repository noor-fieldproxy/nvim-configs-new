
require("nvim-autopairs").setup({

	disable_filetype = { "TelescopePrompt" , "vim" },
	fast_wrap = {
		map = '<M-e>', -- This is (alt + e)
		chars = { '{', '[', '(', '"', "'" },
		pattern = [=[[%'%"%>%]%)%}%,]]=],
		end_key = 'f',
		keys = 'qwertyuiopzxcvbnmasdfghjkl',
		check_comma = true,
		highlight = 'Search',
		highlight_grey='Comment'
	},
})


