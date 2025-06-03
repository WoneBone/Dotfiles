return{
  'ribru17/bamboo.nvim',

  lazy = false,
  priority = 1000,
	config = function()
		require('bamboo').setup {
			transparent = false,
			style = 'multiplex',
		}
    require('bamboo').load()
  end,
}
