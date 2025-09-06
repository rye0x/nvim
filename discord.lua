return {
  "IogaMaster/neocord",
  event = "VeryLazy",
  config = function()
    local neocord = require("neocord")

    -- Ensure Neocord starts when Neovim launches
    neocord.setup({
      -- General options
      logo = "auto",
      logo_tooltip = nil,
      main_image = "language",
      debounce_timeout = 2,
      blacklist = {},
      file_assets = {},
      show_time = true,
      global_timer = false,

      -- Rich Presence text options
      editing_text = "Editing %s",
      file_explorer_text = "Browsing %s",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading %s",
      workspace_text = function(project_name, filename)
        local folder_name = vim.fn.fnamemodify(filename, ":h:t")
        if project_name then
          return string.format("Working on %s", project_name)
        elseif folder_name then
          return string.format("Working on %s", folder_name)
        else
          return "Working on a project"
        end
      end,
      line_number_text = "Line %s out of %s",
      terminal_text = "Using Terminal",
    })

    -- Start Rich Presence on Neovim startup
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        neocord.start()
      end,
    })

    -- Stop Rich Presence on Neovim exit
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        -- Add an additional safety check for the `stop` method
        if neocord and type(neocord.stop) == "function" then
          local ok, err = pcall(function()
            neocord.stop()
          end)
          if not ok then
            vim.notify("Error stopping Neocord: " .. err, vim.log.levels.ERROR)
          end
        else
          vim.notify("Neocord `stop` function not available.", vim.log.levels.WARN)
        end
      end,
    })
  end,
}
