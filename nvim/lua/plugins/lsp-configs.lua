return {
	{
		"williamboman/mason.nvim",
		-- version = "v1.11.0",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			-- manually install packages that do not exist in this list please
			ensure_installed = { "lua_ls", "zls", "ts_ls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

            local function on_attach(_, bufnr)
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            end

           local function with_capabilities(name, opts)
                opts = opts or {}
                opts.capabilities = capabilities
                opts.on_attach = on_attach
                lspconfig[name].setup(opts)
           end

			-- lua
	        with_capabilities("lua_ls" , {
                settings = {
                    Lua = {
                        diagnostics = { globals = {"vim"} },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("",true), 
                            checkThirdParty = false,
                            ignoreDir = {
                                "meta",
                                "mason/packages/lua-language-server/meta",
                            },
                        },
                        telemetry = { enable = false }, 
                    }
                }
            })	
			-- typescript
            with_capabilities("ts_ls")
			-- JsMason
            with_capabilities("eslint")
			-- zig
			with_capabilities("zls")	
            -- yaml
            with_capabilities("yamlls")
            -- tailwindcss
			with_capabilities("tailwindcss")
			-- nix
            with_capabilities("rnix")			
            -- protocol buffer
            with_capabilities("pylsp")	
            -- docker composed
            with_capabilities("docker_compose_language_service")
		    -- python
            with_capabilities("pylsp")

            vim.keymap.set("n", "<leader>fm", function()
				local filetype = vim.bo.filetype
				local symbols_map = {
					javascript = "function",
					typescript = "function",
					java = "class",
					lua = "function",
				}
				local symbols = symbols_map[filetype] or "function"
				require("fzf-lua").lsp_document_symbols({ symbols = symbols })
			end, {})
		end,
	},
}
