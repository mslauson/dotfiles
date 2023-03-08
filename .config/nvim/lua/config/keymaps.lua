-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
local keymap = vim.keymap.set
local opts = { silent = true }
local dap_ok, dap = pcall(require, "dap")
local dap_ui_ok, ui = pcall(require, "dapui")

if not (dap_ok and dap_ui_ok) then
  require("notify")("nvim-dap or dap-ui not installed!", "warning") -- nvim-notify is a separate plugin, I recommend it too!
  return
end

keymap("n", "<leader>flo", "<cmd>FlutterOutlineToggle<cr>", { desc = "Toggle Flutter Outline" })
keymap("n", "<leader>fld", "<cmd>FlutterDevices<cr>", { desc = "Toggle Flutter Devices" })
keymap("n", "<leader>fle", "<cmd>FlutterEmulators<cr>", { desc = "Toggle Flutter Emulators" })
keymap("n", "<leader>flrs", "<cmd>FlutterRestart<cr>", { desc = "Flutter Restart" })
keymap("n", "<leader>flrl", "<cmd>FlutterReload<cr>", { desc = "Flutter Reload" })
keymap("n", "<leader>flq", "<cmd>FlutterQuit<cr>", { desc = "Flutter Quit" })

vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

-- Start debugging session
keymap("n", "<localleader>ds", function()
  dap.continue()
  ui.toggle({})
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
keymap("n", "<localleader>dl", require("dap.ui.widgets").hover, { desc = "Show variable value" })
keymap("n", "<localleader>dc", dap.continue, { desc = "Continue" })
keymap("n", "<localleader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
keymap("n", "<localleader>dn", dap.step_over, { desc = "Step over" })
keymap("n", "<localleader>di", dap.step_into, { desc = "Step into" })
keymap("n", "<localleader>do", dap.step_out, { desc = "Step out" })
keymap("n", "<localleader>dC", function()
  dap.clear_breakpoints()
  require("notify")("Breakpoints cleared", "warn")
end, { desc = "Clear breakpoints" })

-- Close debugger and clear breakpoints
keymap("n", "<localleader>de", function()
  dap.clear_breakpoints()
  ui.toggle({})
  dap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
  require("notify")("Debugger session ended", "warn")
end, { desc = "End debugger session" })
