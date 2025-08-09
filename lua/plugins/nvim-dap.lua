return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"

    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = { os.getenv "HOME" .. "/.local/share/vscode-php-debug/out/phpDebug.js" },
    }

    dap.configurations.php = {
      {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug @ 9003",
        port = 9003,
        -- hostname = "172.17.0.1:9003",
        pathMappings = {
          ["/opt/drupal"] = "/home/erikwegner/dev/gitlab/qwirl/drupal-10",
        },
      },
    }
  end,
}
