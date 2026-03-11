return {
    {  
        "ful1e5/onedark.nvim", 
           name = "onedark", 
           priority = 1100, 
           config = function() 

                -- require("onedark").setup({
                --     style = "dark", 
                -- })
               local themes = {
                    "gruvbox", 
                    "onedark", 
                   "everforest",
               }
               local current_theme_index = 1 
               vim.cmd.colorscheme(themes[current_theme_index])

               vim.keymap.set("n","<leader>nt", function() 
                    current_theme_index = current_theme_index + 1 

                    if current_theme_index > #themes then 
                        current_theme_index = 1 
                    end
                    local theme = themes[current_theme_index] 
                    vim.cmd.colorscheme(theme) 
                    print("Changed nvim theme to: " .. theme) 
                end, { noremap = true, silent = true } )
            end,
    }, 
    {     
        "ellisonleao/gruvbox.nvim", 
        priority = 999 ,
        config = true,   
        name = "gruvbox",
    }, 
    {
          "neanias/everforest-nvim",
          version = false,
          lazy = false,
          name = "everforest", 
          priority = 1200,
    }, 
}
