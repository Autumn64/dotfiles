--[[
  Esta es mi primera vez personalizando (y en general usando) Neovim, por lo que no estoy tan acostumbrada a cómo se debe
  hacer la configuración en Lua, además de que me costó bastante trabajo entenderle a lazy.nvim. Por causa de ello,
  esta configuración fue en un principio hecha con ChatGPT, y después yo, sin usar IA, me tomé el tiempo de estudiarla
  y posteriormente modificarla a algo que me fuera más adecuado.

  Vengo de un entorno Vim+CoC, y la verdad estaba bastante a gusto así. Si bien me agrada la idea de aprovechar el soporte
  nativo que Neovim tiene para el LSP, quería que al menos tuviera un comportamiento y una experiencia de usuario similares
  a las de CoC, lo cual explica esta configuración tan "rara".
--]]
return {
    --[[
      Con base en lo que entendí, Mason es un gestor de servidores LSP que evita el tedio
      de tener que estar instalando a mano cada servidor.

      Por lo que vi, estos plugins se instalarían a mano con npm. O sea, un CoC pero mucho más tedioso xD.
    --]]
    {
        "williamboman/mason.nvim",
        config = true,
    },

    {
        "williamboman/mason-lspconfig.nvim",
	opts = {
            ensure_installed = {
		"basedpyright",
		"bashls",
                "ts_ls",
                "html",
                "cssls",
                "emmet_ls",
		"csharp_ls"
            }
	}
    },

    --[[
      nvim-lspconfig ahora sí es el que maneja los servidores LSP. Antes usaba una sintaxis tipo
      'require()', pero ahora ya se basa casi exclusivamente en el soporte nativo de Neovim para el LSP (a costa
      de que el plugin funcione muy mal o directamente no arranque en versiones de Neovim inferiores a la 0.11).
    --]]
    {
        "neovim/nvim-lspconfig",

        config = function()

	-- Carga el inlay hinting
	vim.api.nvim_create_autocmd("LspAttach", {
	  callback = function(args)
	    local client = vim.lsp.get_client_by_id(args.data.client_id)

	    if client and client.server_capabilities.inlayHintProvider then
	      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
	    end
	  end
	})

        -- Python
	vim.lsp.config("basedpyright", {
	  settings = {
	    basedpyright = {
	      --[[
		Esta sección es porque basedpyright pone warnings con literalmente todo, y eso me era
		demasiado molesto. Con esta configuración lo cambio a algo parecido a como lo tenía con CoC.
	      --]]
	      analysis = {
		typeCheckingMode = "basic",

		diagnosticSeverityOverrides = {
		  reportMissingTypeStubs = "none",
		  reportUnknownMemberType = "none",
		  reportUnknownArgumentType = "none",
		  reportUnknownVariableType = "none",
		  reportUntypedFunctionDecorator = "none",
		  reportUnusedCallResult = "information",
		  reportImplicitOverride = "none",
		  reportIncompatibleMethodOverride = "none",
		  reportArgumentType = "none",
		  reportAny = "none"
		}
	      }
	    },
	  }
	})
        vim.lsp.enable("basedpyright")

        -- JavaScript / TypeScript
	vim.lsp.config("ts_ls", {
	  settings = {
	    typescript = {
	      inlayHints = {
		includeInlayParameterNameHints = "all",
		includeInlayParameterNameHintsWhenArgumentMatchesName = false,
		includeInlayFunctionParameterTypeHints = true,
		includeInlayVariableTypeHints = true,
		includeInlayPropertyDeclarationTypeHints = true,
		includeInlayFunctionLikeReturnTypeHints = true,
		includeInlayEnumMemberValueHints = true,
	      },
	    },
	    javascript = {
	      inlayHints = {
		includeInlayParameterNameHints = "all",
		includeInlayFunctionParameterTypeHints = true,
		includeInlayVariableTypeHints = true,
		includeInlayPropertyDeclarationTypeHints = true,
		includeInlayFunctionLikeReturnTypeHints = true,
	      },
	    },
	  },
	})
        vim.lsp.enable("ts_ls")

        -- Web
        vim.lsp.enable("html")
        vim.lsp.enable("cssls")

        -- Emmet
        vim.lsp.config("emmet_ls", {
            filetypes = {
                "html",
                "css",
                "javascript",
		"htmldjango"
            }
        })
        vim.lsp.enable("emmet_ls")

	-- C#
	vim.lsp.enable("csharp_ls")

	-- Keybindings que se parecen a los de CoC
        -- Ir a definición
        vim.keymap.set("n", "gd", vim.lsp.buf.definition)

        -- Referencias
        vim.keymap.set("n", "gr", vim.lsp.buf.references)

        -- Hover 
        vim.keymap.set("n", "K", vim.lsp.buf.hover)

        -- Renombrar
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

        -- Lista de errores. Lo puse así en sentido "DiaGnose"
        vim.keymap.set("n", "<leader>dg", vim.diagnostic.setloclist)
        end
    },

    -- nvim-cmp maneja el autocompletado
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },

        config = function()
        local cmp = require("cmp")

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            },
	    --[[
	      Keybindings para el manejo del menú de autocompletado. No me molesta y de hecho estoy acostumbrada
	      a usar Enter para aceptar una selección, pero sí necesito el atajo para quitar el menú cuando no quiera
	      completar nada.
	    --]]
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-a>"] = cmp.mapping.abort()
            })
        })
        end
    }
}
