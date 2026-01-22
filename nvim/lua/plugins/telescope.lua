-- No puedo expresar lo mucho que amo este plugin
return {
    'nvim-telescope/telescope.nvim', 
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    opts = {
      defaults = {
	file_ignore_patterns = {
	  ".git/.*",
	  "node_modules/.*",
	  "package%-lock.json"
	}
      },
      pickers = {
	find_files = { hidden = true }
      }
    }
}
