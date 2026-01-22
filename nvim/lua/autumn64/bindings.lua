-- Esto lo vi en Internet y me pareció muy ingenioso
local function map(mode, key, value, description)
    vim.keymap.set(mode, key, value, { desc = description })
end

-- Atajo para salir rápidamente de una ventana
map("n", "<C-q>", function ()
  vim.cmd("confirm q")
end, "Ejecuta `:q` en la ventana actual.")

-- Atajo para el comando :noh
map("n", "<leader>N", function()
  vim.cmd("noh")
end, "Ejecuta `:noh`.")

-- Atajos para Neotree
map("n", "<leader>n", function()
  vim.cmd("Neotree")
  vim.cmd("vertical resize -10")
end, "Inicia Neotree.")

-- Atajos para la navegación entre splits
map("n", "<C-H>", "<C-w>h", "Se mueve al split de la izquierda.")
map("n", "<C-J>", "<C-w>j", "Se mueve al split de abajo.")
map("n", "<C-K>", "<C-w>k", "Se mueve al split de arriba.")
map("n", "<C-L>", "<C-w>l", "Se mueve al split de la derecha.")

-- Atajos del portapapeles
map("n", "<leader>y", '"+yy', "Copia la línea actual (o un rango de líneas con la sintaxis N<leader>y) al portapapeles.")
map("v", "<leader>y", '"+y', "Copia la selección actual al portapapeles del sistema.")
map("n", "<leader>d", '"+dd', "Corta la línea actual (o un rango de líneas con la sintaxis N<leader>y) al portapapeles.")
map("v", "<leader>d", '"+d', "Corta la selección actual al portapapeles del sistema.")

-- Atajos para Telescope
map('n', '<leader>f', function()
  vim.cmd("Telescope find_files")
end, 'Abre el buscador de archivos de Telescope.')
map('n', '<leader>lg', function()
  vim.cmd("Telescope live_grep")
end,  'Usa la funcionalidad de live grep de Telescope.')

-- Atajos para buffers
map('n', '<leader>bl', function()
  vim.cmd("buffers")
end,  'Abre una lista de los buffers actualmente abiertos.')
map('n', '<leader>bn', function()
  vim.cmd("bn")
end,  'Cambia al buffer siguiente.')
map('n', '<leader>bp', function()
  vim.cmd("bp")
end,  'Cambia al buffer anterior.')

-- Atajos creados a partir de macros o comandos
map('n', '<leader>si(', function()
  vim.cmd('normal! ci("pa"')
end, 'Pone comillas a cualquier texto entre paréntesis.')
map('n', '<leader>si{', function()
  vim.cmd('normal! ci{"pa"')
end, 'Pone comillas a cualquier texto entre llaves.')
map('n', '<leader>si[', function()
  vim.cmd('normal! ci["pa"')
end, 'Pone comillas a cualquier texto entre corchetes.')
map('n', '<leader>siw', function()
  vim.cmd('normal! bi"ea"')
end, 'Pone comillas a una palabra.')
