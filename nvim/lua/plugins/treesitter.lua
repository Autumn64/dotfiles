--[[
  A ver, en un inicio tener que instalar esto me pareció una real webada. Luego empecé a programar de verdad,
  y entendí que, si bien tampoco es la gran maravilla, es verdad que mejora la experiencia de leer código. Al menos
  es mejor que el coloreado de código rudimentario de Vim.
--]]
return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            highlight = { enable = true },
            indent = { enable = true },
            autotage = { enable = true },
            ensure_installed = {
                "c",
                "css",
                "html",
                "javascript",
                "lua",
                "markdown",
                "markdown_inline",
                "php",
                "python",
                "vim",
                "vimdoc"
            }
        })
    end
}
