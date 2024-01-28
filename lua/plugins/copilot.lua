return {
  {
    "zbirenbaum/copilot.lua",
    opts = function(_, opts)
      opts.suggestion = {
        enabled = true,
        keymap = {
          accept = "<C-'>",
        },
      }
    end,
  },
}
