return {
  "folke/noice.nvim",
  opts = function(_, opts)
    table.insert(opts.routes, {
      filter = {
        event = "notfiy",
        find = "No information available",
      },
      opts = { skip = true },
    })

    opts.presets.lsp_doc_border = true
  end,
}
