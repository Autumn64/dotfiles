--[[
  Desde hace meses quería probar este tema en Vim, pero para usarlo tenía que compilar Vim
  con soporte para Lua. Para eso mejor usar Neovim.
--]]
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
    require("catppuccin").setup({
        flavour = "macchiato"
    })

    vim.cmd.colorscheme("catppuccin")
    end
}
