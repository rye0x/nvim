return {
    "nvim-telescope/telescope.nvim",
    dependencies = { -- Remove fzf-native or any unwanted extensions
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
        prompt_prefix = "> ",
        selection_caret = "> ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top" },
        },
      },
      extensions = {}, -- Ensure no FZF is loaded
    },
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
  }
