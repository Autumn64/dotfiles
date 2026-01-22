local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

--[[
  Busca la carpeta definida por lazypath. Si no la encuentra, clona el repositorio de GitHub
  de lazy.nvim (lo cual me parece genial porque así no hay que instalar nada a mano).
--]]
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
})
end

-- rtp = runtime path, similar al PATH de POSIX
vim.opt.rtp:prepend(lazypath)

-- Aquí ahora sí se cargan los plugins, que están separados en archivos distintos
require("lazy").setup({
    spec = {
        { import = "plugins" }
    },
    change_detection = { notify = false }
})
