return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 20, -- Size of the terminal window
      open_mapping = [[<c-\>]], -- Keybinding to toggle terminal (Ctrl + \)
      shade_filetypes = {}, -- Filetypes that should have a shaded background
      shade_terminals = true, -- Whether to shade terminal windows
      shading_factor = 2, -- Controls the darkness of the shade (0 is no shade)
      persist_size = true, -- Remember the size of terminal windows between sessions
      direction = "float", -- Options: "vertical", "horizontal", "float"
      close_on_exit = true, -- Close terminal when it exits
      shell = vim.o.shell, -- Set the default shell
      hide_numbers = true, -- Hide line numbers in terminal windows
      auto_scroll = true, -- Automatically scroll terminal output
      terminal_mappings = true, -- Enable key mappings in terminal
      winbar = {
        enabled = true, -- Show a winbar (top bar) for toggleterm windows
        name_formatter = function(term) -- Customize the winbar's name
          return "Terminal " .. term.id
        end,
      },
    })
  end,
}
