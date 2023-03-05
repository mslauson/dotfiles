-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
local keymap = vim.keymap.set
local opts = { silent = true }
keymap("n", "<leader>flo", "<cmd>FlutterOutlineToggle<cr>", { desc = "Toggle Flutter Outline" })
keymap("n", "<leader>fld", "<cmd>FlutterDevices<cr>", { desc = "Toggle Flutter Devices" })
keymap("n", "<leader>flrs", "<cmd>FlutterRestart<cr>", { desc = "Flutter Restart" })
keymap("n", "<leader>flrl", "<cmd>FlutterReload<cr>", { desc = "Flutter Reload" })
keymap("n", "<leader>flq", "<cmd>FlutterQuit<cr>", { desc = "Flutter Quit" })
