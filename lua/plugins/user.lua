-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:
---@type LazySpec
return {
  {
    "kburdett/vim-nuuid",
    init = function(_)
      vim.g.nuuid_no_mappings = 1 -- disable default key mapping
      vim.keymap.set("n", "<Leader>U", "<Plug>Nuuid", { desc = "Insert UUID" })
    end,
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    init = function()
      require("tabnine").setup {
        disable_auto_comment = true,
        accept_keymap = "<C-_>",
        dismiss_keymap = "<C-[>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
        log_file_path = nil, -- absolute path to Tabnine log file
      }
    end,
  },
}
