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

-- flutter maps
keymap("n", "<leader>flo", "<cmd>FlutterOutlineToggle<cr>", { desc = "Toggle Flutter Outline" })
keymap("n", "<leader>fld", "<cmd>FlutterDevices<cr>", { desc = "Toggle Flutter Devices" })
keymap("n", "<leader>fle", "<cmd>FlutterEmulators<cr>", { desc = "Toggle Flutter Emulators" })
keymap("n", "<leader>flrs", "<cmd>FlutterRestart<cr>", { desc = "Flutter Restart" })
keymap("n", "<leader>flrl", "<cmd>FlutterReload<cr>", { desc = "Flutter Reload" })
keymap("n", "<leader>flq", "<cmd>FlutterQuit<cr>", { desc = "Flutter Quit" })

-- dap maps
vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

-- Start debugging session
keymap("n", "<localleader>ds", function()
  dap.continue()
  ui.toggle({})
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
keymap("n", "<localleader>dh", require("dap.ui.widgets").hover, { desc = "Show variable value" })
keymap("n", "<localleader>dc", dap.continue, { desc = "Continue" })
keymap("n", "<localleader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
keymap("n", "<localleader>dn", dap.step_over, { desc = "Step over" })
keymap("n", "<localleader>di", dap.step_into, { desc = "Step into" })
keymap("n", "<localleader>do", dap.step_out, { desc = "Step out" })
keymap("n", "<localleader>dC", function()
  dap.clear_breakpoints()
  require("notify")("Breakpoints cleared", "warn")
end, { desc = "Clear breakpoints" })

keymap("n", "<localleader>dt", function()
  require("dapui").toggle()
end, { desc = "Toggle Debugger UI" })

-- Close debugger and clear breakpoints
keymap("n", "<localleader>de", function()
  dap.clear_breakpoints()
  ui.toggle({})
  dap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
  require("notify")("Debugger session ended", "warn")
end, { desc = "End debugger session" })

-- dap-ui-maps

-- keymap("n", "<leader>dt", ui.toggle(), { desc = "Toggle DAP UI" })

-- neotree
keymap("n", "<leader>ntrf", "<cmd>Neotree left %:p:h:h %:p<cr>", { desc = "NeoTree Reveal File" })
keymap("n", "<leader>ntsb", "<cmd>Neotree float buffers<cr>", { desc = "NeoTree Show Buffers" })
keymap("n", "<leader>ntcb", "<cmd>Neotree close buffers<cr>", { desc = "NeoTree Close Buffers" })
keymap("n", "<leader>ntsg", "<cmd>Neotree float git_status<cr>", { desc = "NeoTree Show Git Status" })
keymap("n", "<leader>ntcb", "<cmd>Neotree close git_status<cr>", { desc = "NeoTree Close Git Status" })

-- rnvimr
keymap("n", "<leader>ro", "<cmd>RnvimrToggle<cr>", { desc = "Ranger Toggle" })

-- automation (automaton.nvim)
--

keymap.set("n", "<F5>", "<CMD>Automaton launch default<CR>")
keymap.set("n", "<F6>", "<CMD>Automaton debug default<CR>")
keymap.set("n", "<F8>", "<CMD>Automaton tasks default<CR>")

keymap.set("n", "<leader>aC", "<CMD>Automaton create<CR>")
keymap.set("n", "<leader>aI", "<CMD>Automaton init<CR>")
keymap.set("n", "<leader>aL", "<CMD>Automaton load<CR>")

keymap.set("n", "<leader>ac", "<CMD>Automaton config<CR>")
keymap.set("n", "<leader>ar", "<CMD>Automaton recents<CR>")
keymap.set("n", "<leader>aw", "<CMD>Automaton workspaces<CR>")
keymap.set("n", "<leader>aj", "<CMD>Automaton jobs<CR>")
keymap.set("n", "<leader>al", "<CMD>Automaton launch<CR>")
keymap.set("n", "<leader>ad", "<CMD>Automaton debug<CR>")
keymap.set("n", "<leader>at", "<CMD>Automaton tasks<CR>")

keymap.set("n", "<leader>aol", "<CMD>Automaton open launch<CR>")
keymap.set("n", "<leader>aov", "<CMD>Automaton open variables<CR>")
keymap.set("n", "<leader>aot", "<CMD>Automaton open tasks<CR>")
keymap.set("n", "<leader>aoc", "<CMD>Automaton open config<CR>")

-- visual Mode
keymap.set("v", "<F5>", "<CMD><C-U>Automaton launch default<CR>")
keymap.set("v", "<F6>", "<CMD><C-U>Automaton debug default<CR>")
keymap.set("v", "<F8>", "<CMD><C-U>Automaton tasks default<CR>")
keymap.set("v", "<leader>al", "<CMD><C-U>Automaton launch<CR>")
keymap.set("v", "<leader>ad", "<CMD><C-U>Automaton debug<CR>")
keymap.set("v", "<leader>at", "<CMD><C-U>Automaton tasks<CR>")
