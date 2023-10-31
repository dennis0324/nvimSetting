-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "nvimtools/none-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "prettier",
        "stylua",
        "clang-format",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "node2",
        "python",
        "cpptools",
        "codelldb",
      },
      dependencies = {
        "theHamsta/nvim-dap-virtual-text",
      },
      handlers = {
        cppdbg = function(source_name)
          local dap = require "dap"
          dap.adapters.cppdbg = {
            id = "codelldb",
            type = "executable",
            command = "/home/dennis/.gitBuild/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
            options = {
              detached = false,
            },
          }
          dap.configurations.c = {
            {
              name = "C Debug And Run",
              type = "codelldb",
              request = "launch",
              program = function()
                local cmd = "!gcc -g -o src/make-dot ./src/make-dot.c ./src/misc.c ./src/core.c"
                vim.cmd(cmd)
                return "${fileDirname}/" .. "make-dot"
                -- First, check if exists CMakeLists.txt
                --   local cwd = vim.fn.getcwd()
                --   if file.exists(cwd, "CMakeLists.txt") then
                --     -- Todo. Then invoke cmake commands
                --     -- Then ask user to provide execute file
                --     return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                --   else
                --     local fileName = vim.fn.expand "%:t:r"
                --     if not file.exists(cwd, "bin") then
                --       -- create this directory
                --       os.execute("mkdir " .. "bin")
                --     end
                --     local cmd = "!gcc -g % -o bin/" .. fileName
                --     -- First, compile it
                --     vim.cmd(cmd)
                --     -- Then, return it
                --     return "${fileDirname}/bin/" .. fileName
                --   end
              end,
              args = function()
                local args_string = vim.fn.input "Arguments: "
                return vim.split(args_string, " ")
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
            },
            {
              name = "testing",
              type = "cppdbg",
              request = "launch",
              program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
              cwd = "${workspaceFolder}",
              stopAtEntry = true,
            },
            {
              name = "Attach to gdbserver :1234",
              type = "cppdbg",
              request = "launch",
              MIMode = "gdb",
              miDebuggerServerAddress = "localhost:1234",
              miDebuggerPath = "/usr/bin/gdb",
              cwd = "${workspaceFolder}",
              program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
            },
          }
        end,
      },
    },
    -- opts = function(_, opts)
    --   -- add more things to the ensure_installed table protecting against community packs modifying it
    --   opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
    --     "node2",
    --     "python",
    --     "codelldb",
    --     "cpptools",
    --   })
    --
    --   opts.handlers = {
    --     cppdbg = function(source_name)
    --       local dap = require "dap"
    --       dap.adapters.codelldb = {
    --         type = "server",
    --         port = "${port}",
    --         executable = {
    --           -- CHANGE THIS to your path!
    --           command = codelldb.codelldb_path,
    --           args = { "--port", "${port}" },
    --
    --           -- On windows you may have to uncomment this:
    --           -- detached = false,
    --         },
    --       }
    --
    --       -- dap.configurations.c = {}
    --     end,
    --   }
    -- end,
  },
}
