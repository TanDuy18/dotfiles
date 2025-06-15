return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
            "saadparwaiz1/cmp_luasnip", 
            "rafamadriz/friendly-snippets"
        },
        config = function ()
           require("luasnip.loaders.from_vscode").lazy_load() 
        end, 
	},
	{
		"hrsh7th/nvim-cmp",
        dependencies = { 
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "windwp/nvim-autopairs",
        },
		config = function()
			local cmp = require("cmp")
            local luasnip = require("luasnip")

            -- autopairs setup 
            require("nvim-autopairs").setup()
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            -- 
            
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "ts_ls" },
					{ name = "nix" },
                    { name = "path"},
					{ name = "render-markdown" },
				}),
			})
             cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = "path" },
              { name = "cmdline" },
            },
          })
            cmp.setup.filetype("javascript", {
               sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
              }),
            })

            cmp.setup.filetype("typescript", {
              sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
              }),
            })

            cmp.setup.filetype("markdown", {
              sources = cmp.config.sources({
                { name = "buffer" },
                { name = "path" },
                -- { name = "spell" }, -- nếu bạn dùng gợi ý chính tả
              }),
            })

            cmp.setup.filetype("java", {
              sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "luasnip" },
              }),
            })

            cmp.setup.filetype("nix", {
              sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
              }),
            })
            end,
	},
}
