-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, slient = true }
keymap.set("i", "<esc>", "<cmd>stopinsert<cr>")

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- deleting word backword
keymap.set("n", "dw", "vg_d")

-- select all
keymap.set("n", "sa", "gg<S-v>G")
