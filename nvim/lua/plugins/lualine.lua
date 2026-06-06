return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local function short_filename()
            local root = vim.fn.getcwd()
            local filepath = vim.fn.expand("%:p")
            local result = ""
            if not filepath:find(root, 1, true) then
                result = vim.fn.expand("%:t")
            else 
                local relpath = filepath:sub(#root + 2)
                local parts = vim.split(relpath, "/")
                local len = #parts
                if len > 2 then
                    result = table.concat({ parts[len - 2], parts[len - 1], parts[len] }, "/")
                else
                    result = relpath
                end
            end
            local is_modified = vim.api.nvim_buf_get_option(0, "modified")
            if is_modified then 
                return result .. "[+]" 
            else 
                return result 
            end
        end


        require("lualine").setup(
            { 
                options = { 
                    theme = "Gruvbox_dark"},
                sections = { 
                    lualine_c = {
                        { 
                            short_filename , 
                        } 
                    }, 
                    lualine_z = {}, 
                }, 
            })
        end,

}
