return{
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('bamboo').setup {
		transparent = false
    }
    require('bamboo').load()
  end,
}
