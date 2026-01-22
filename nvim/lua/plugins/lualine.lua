-- Bastante bonito y con más cosas por defecto que Airline
return {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = "tomorrow_night",
            component_separators = { left = "", right = ""},
            section_separators = { left = "", right = ""},
        }
    }
}
