return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      doc = {
        enabled = true,
        inline = true,
        float = true,
        max_width = 100,
        max_height = 50,
        conceal = function(lang, type)
          return lang == "mermaid" or type == "math"
        end,
      },
    },
  },
}
