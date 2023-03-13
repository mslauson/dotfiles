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

keymap("n", "<F5>", "<cmd>Automaton launch default<CR>", { desc = "Automaton launch default" })
keymap("n", "<F6>", "<cmd>Automaton debug default<CR>", { desc = "Automaton debug default" })
keymap("n", "<F8>", "<cmd>Automaton tasks default<CR>", { desc = "Automaton tasks default" })

keymap("n", "<leader>aC", "<cmd>Automaton create<CR>", { desc = "Automaton create" })
keymap("n", "<leader>aI", "<cmd>Automaton init<CR>", { desc = "Automaton init" })
keymap("n", "<leader>aL", "<cmd>Automaton load<CR>", { desc = "Automaton load" })

keymap("n", "<leader>ac", "<cmd>Automaton config<CR>", { desc = "Automaton config" })
keymap("n", "<leader>ar", "<cmd>Automaton recents<CR>", { desc = "Automaton recents" })
keymap("n", "<leader>aw", "<cmd>Automaton workspaces<CR>", { desc = "Automaton workspaces" })
keymap("n", "<leader>aj", "<cmd>Automaton jobs<CR>", { desc = "Automaton jobs" })
keymap("n", "<leader>al", "<cmd>Automaton launch<CR>", { desc = "Automaton launch" })
keymap("n", "<leader>ad", "<cmd>Automaton debug<CR>", { desc = "Automaton debug" })
keymap("n", "<leader>at", "<cmd>Automaton tasks<CR>", { desc = "Automaton tasks" })

keymap("n", "<leader>aol", "<cmd>Automaton open launch<CR>", { desc = "Automaton open launch" })
keymap("n", "<leader>aov", "<cmd>Automaton open variables<CR>", { desc = "Automaton open variables" })
keymap("n", "<leader>aot", "<cmd>Automaton open tasks<CR>", { desc = "Automaton open tasks" })
keymap("n", "<leader>aoc", "<cmd>Automaton open config<CR>", { desc = "Automaton open config" })

-- visual Mode
keymap("v", "<F5>", "<cmd><C-U>Automaton launch default<CR>", { desc = "Automaton launch default" })
keymap("v", "<F6>", "<cmd><C-U>Automaton debug default<CR>", { desc = "Automaton debug default" })
keymap("v", "<F8>", "<cmd><C-U>Automaton tasks default<CR>", { desc = "Automaton tasks default" })
keymap("v", "<leader>al", "<cmd><C-U>Automaton launch<CR>", { desc = "Automaton launch" })
keymap("v", "<leader>ad", "<cmd><C-U>Automaton debug<CR>", { desc = "Automaton debug" })
keymap("v", "<leader>at", "<cmd><C-U>Automaton tasks<CR>", { desc = "Automaton tasks" })

-- symbols-outline
keymap("n", "<leader>cot", "<cmd>SymbolsOutline<cr>", { desc = "Symbols Outline" })
keymap("n", "<leader>coo", "<cmd>SymbolsOutlineOpen<cr>", { desc = "Symbols Outline Open" })
keymap("n", "<leader>coc", "<cmd>SymbolsOutlineClose<cr>", { desc = "Symbols Outline Close" })
