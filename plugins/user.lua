return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "kburdett/vim-nuuid",
    event = "User AstroFile",
  },
  'folke/trouble.nvim',
  {
    'codota/tabnine-nvim',
    build = "./dl_binaries.sh",
    init = function()
      require('tabnine').setup({
        disable_auto_comment = true,
        accept_keymap = "<C-_>",
        dismiss_keymap = "<C-[>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
        log_file_path = nil, -- absolute path to Tabnine log file
      })
    end,
  },
}
