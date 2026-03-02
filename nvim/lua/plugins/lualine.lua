return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local function short_filename()
            local root = vim.fn.getcwd()
            local filepath = vim.fn.expand("%:p")
            if not filepath:find(root, 1, true) then
                return vim.fn.expand("%:t")
            end

            local relpath = filepath:sub(#root + 2)
            local parts = vim.split(relpath, "/")
            local len = #parts
            if len > 2 then
                return table.concat({ parts[len - 2], parts[len - 1], parts[len] }, "/")
            else
                return relpath
            end
        end

        local function lualine_theme() 
            local cs = vim.g.colors_name
            if cs == "gruvbox" then 
                return "gruvbox" 
            elseif cs == "onedark" or cs == "OneDark" then 
                return "OceanicNext" 
            else 
                return "Auto" 
            end
        end


        require("lualine").setup({
            options = {
                theme = lualine_theme(),
            },
            sections = {
                lualine_c = {
                    { short_filename },
                },
                lualine_z = {},
            },
        })

         vim.api.nvim_create_autocmd("ColorScheme", {
                    callback = function()
                        require("lualine").setup({
                            options = {
                                theme = lualine_theme(),
                            },
                        })
                    end,
            })
    end,
}
