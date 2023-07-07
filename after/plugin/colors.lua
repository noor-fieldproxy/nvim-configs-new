
function ColorMyPencils(color) 
	color = color or "gruvbox-material"

	vim.cmd.colorscheme(color)


	-------------------------------
	-- This is customatization settings from help

	-- vim.o.background = "dark" -- or "light" for light mode

	-- Available values: 'hard', 'medium'(default), 'soft'
	vim.g.gruvbox_material_background = 'soft'

	-- For better performance
	vim.g.gruvbox_material_better_performance = 1

	-------------------------------
	-- This is for setting transparent background

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )

	----------------------------------
end 

ColorMyPencils()
