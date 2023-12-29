return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    opts = {
      options = {
        colorblind = {
          enable = true, -- Enable colorblind support
          simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
          severity = {
            protan = 1, -- Severity [0,1] for protan (red)
            deutan = 0, -- Severity [0,1] for deutan (green)
            tritan = 0, -- Severity [0,1] for tritan (blue)
          },
        },
        inverse = {
          visual = false,
        },
      },
    },
  }, -- lazy
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "main",
      bold_vert_split = false,
      disable_italics = false,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",

    opts = {
      integrations = {
        neotree = true,
        aerial = true,
        harpoon = true,
        mason = true,
        which_key = true,
      },
      dim_inactive = {
        enabled = true,
        percentage = 0.35,
      },
      color_overrides = {
        mocha = {
          rosewater = "#efc9c2",
          flamingo = "#ebb2b2",
          pink = "#f2a7de",
          mauve = "#b889f4",
          red = "#ea7183",
          maroon = "#ea838c",
          peach = "#f39967",
          yellow = "#eaca89",
          green = "#96d382",
          teal = "#78cec1",
          sky = "#91d7e3",
          sapphire = "#68bae0",
          blue = "#739df2",
          lavender = "#a0a8f6",
          text = "#b5c1f1",
          subtext1 = "#a6b0d8",
          subtext0 = "#959ec2",
          overlay2 = "#848cad",
          overlay1 = "#717997",
          overlay0 = "#63677f",
          surface2 = "#505469",
          surface1 = "#3e4255",
          surface0 = "#2c2f40",
          base = "#0e0f16",
          mantle = "#141620",
          crust = "#999999",
        },
      },
    },
  },
}
