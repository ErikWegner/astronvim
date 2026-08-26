return {
  "rebelot/heirline.nvim",

  opts = function(_, opts)
    local selection = {
      condition = function()
        local mode = vim.fn.mode()

        return mode == "v" or mode == "V" or mode == "\22" -- CTRL-V / Visual Block
      end,

      provider = function()
        local mode = vim.fn.mode()

        -- Während des Visual Modes verwenden wir "v" und "."
        -- und NICHT die Visual-Marks '< und '>.
        local start_line = vim.fn.line "v"
        local end_line = vim.fn.line "."

        local lines = math.abs(end_line - start_line) + 1

        local chars = vim.fn.wordcount().visual_chars or 0

        -- Visual Block
        if mode == "\22" then
          local start_col = vim.fn.col "v"
          local end_col = vim.fn.col "."

          local cols = math.abs(end_col - start_col) + 1

          chars = lines * cols
        end

        return string.format(" %dC %dL ", chars, lines)
      end,

      -- Wichtig:
      -- CursorMoved wird beim Erweitern/Verkleinern der
      -- Visual-Auswahl ausgelöst.
      update = {
        "ModeChanged",
        "CursorMoved",
        "CursorMovedI",
      },
    }

    -- Component in die AstroNvim-Statusline einfügen.
    table.insert(opts.statusline, 2, selection)

    return opts
  end,
}
