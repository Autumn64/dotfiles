--[[ 
  Ya no lo uso tanto en favor de Telescope, pero igual decidí conservarlo. Me gusta que es prácticamente
  igual a NERDTree.
--]]
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,

    --[[
      Cierra automáticamente Neotree al abrir un archivo.
    --]]
    opts = {
      event_handlers = {
	{
	  event = "file_open_requested",
	  handler = function()
	    -- auto close
	    -- vim.cmd("Neotree close")
	    -- OR
	    require("neo-tree.command").execute({ action = "close" })
	  end
	}
      }
    }
}
