-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>yy"] = { '"*yy', desc = "Yank line to System Clipboard" },
    ["<leader>yY"] = { '"*yg_', desc = "Yank current location to End of Line to Sys Clipboard" },
    -- ["pP"] = { '"*p', desc = "paste" },
    -- ["pp"] = { '"*p', desc = "paste" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    --
    -- this is for debugger
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      desc = "Add breakpoint at line",
    },
    ["<leader>ds"] = {
      "<cmd> DapContinue <CR>",
      desc = "Start or continue the debugger",
    },
    ["<leader>dt"] = {
      "<cmd> DapTerminate <CR>",
      desc = "Terminate the debugger",
    },
    ["<leader>dk"] = { '<Cmd>lua require("dapui").eval()<CR>' },
    ["<leader>jj"] = { "<Cmd>m +1<CR>", desc = "move line down one" },
    ["<leader>kk"] = { "<Cmd>m -2<CR>", desc = "move line up one" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    -- ["<leader>y"] = { '"*y', desc = "Yank to System Clipboard" },
    -- ["p"] = { '"0p' },
  },
  --   },
  -- },
}
