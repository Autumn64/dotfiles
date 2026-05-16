-- Configuración inicial de Neovim
local opt = vim.opt
local g = vim.g

-- UI del editor
opt.number = true
opt.cursorline = true
opt.autoindent = true
opt.smartindent = true
opt.showmode = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.guicursor = "a:block"

--[[
La guía de Neovim con respecto a tabstop recomienda poner tabstop en 8, y softtabstop y shiftwidth en
el valor deseado, de modo que la indentación se vea conforme a lo esperado en Neovim, y que al abrir
el archivo en otro editor de texto también se vea correctamente (lo cual sí ha sido un problema
para mí por no saber configurar eso en Vim).
--]]
opt.expandtab = false
opt.tabstop = 8
opt.shiftwidth = 2
opt.softtabstop = 2

-- Tiempo de espera para que una secuencia de teclas se considere completa
opt.timeoutlen = 800

-- Tiempo de espera antes de escribir el archivo .swp
opt.updatetime = 200

--[[
  No habilito "unnamedplus" en el portapapeles para mejor yo poner mi propia
  combinación de teclas cuando quiera copiar hacia el sistema operativo.
--]]
opt.clipboard = ""

--[[
  Desactiva backup y agrega undofile (que guarda el historial de cambios
  incluso después de cerrar el archivo, un verdadero salvavidas).
--]]
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.swapfile = true

-- Tecla leader (me gusta que sea la barra invertida porque igual tengo el teclado en US-altgr-intl)
g.mapleader = "\\"
g.maplocalleader = "\\"

-- Tipos de archivo personalizados
vim.filetype.add({
  extension = {
    njk = "htmldjango"
  }
})
