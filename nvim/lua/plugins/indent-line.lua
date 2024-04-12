return {
  {
    "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
    config = function()
    local highlight = {
        "Aero",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "Aero", { fg = "#7CB9E8" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#4D9EC9" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#2E7CA6" }) -- done
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#175E85" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#05476B" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#06367D" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#012B69" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
        end,
   }
}

--[[ 
{
    {
        {
            {
                {
                    {
                        {
                            {
                                {
                                    {
                                        {
                                            {
                                                {
                                                    {} 
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
} ]]
