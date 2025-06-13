return{
    {
        "williamboman/mason.nvim",
        config = function()
           require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false , 
        opts = {
            auto_install = true ,
            ensure_installed = { "lua_ls" , "ts_ls" },
        }
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false ,
        config = function() 
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig") 

            -- lua 
            lspconfig.lua_ls.setup({
                capabilities = capabilities ,
                settings = {
                    Lua = {
                        diagnostics = { 
                            globals = {"vim"},
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("",true),
                            checkThirdParty = false ,
                        },
                        telemetry = {
                            enable = false ,
                        },
                    },
                },
            })

            -- typescript 
            lspconfig.ts_ls.setup({
                capabilities = capabilities , 
            })

            -- Js 
            lspconfig.eslint.setup({
                 capabilities=  capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) 


            vim.keymap.set("n", "<leader>fm", function()
				local filetype = vim.bo.filetype
				local symbols_map = {
					python = "function",
					javascript = "function",
					typescript = "function",
					java = "class",
					lua = "function",
					go = { "method", "struct", "interface" },
				}
				local symbols = symbols_map[filetype] or "function"
				require("fzf-lua").lsp_document_symbols({ symbols = symbols })
			end, {})
        end,
    },
}
