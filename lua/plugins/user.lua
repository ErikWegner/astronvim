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
}
