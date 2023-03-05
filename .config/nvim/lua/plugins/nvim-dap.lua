return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.adapters.dart = {
        type = "executable",
        command = "dart",
        -- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
        args = { "debug_adapter" },
      }
      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = os.getenv("HOME") .. "/flutter/bin/cache/dart-sdk/",
          flutterSdkPath = os.getenv("HOME") .. "/flutter",
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
        },
      }
    end,
  },
}
