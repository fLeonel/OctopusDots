local function mermaid_block(buf, row)
  local ok, parser = pcall(vim.treesitter.get_parser, buf, "markdown")
  if not ok or not parser then
    return
  end
  local node = parser:parse()[1]:root():named_descendant_for_range(row, 0, row, 0)
  while node and node:type() ~= "fenced_code_block" do
    node = node:parent()
  end
  if not node then
    return
  end
  for child in node:iter_children() do
    if child:type() == "info_string" then
      if not vim.treesitter.get_node_text(child, buf):match("^%s*mermaid") then
        return
      end
      local first, _, last, last_col = node:range()
      if last_col == 0 then
        last = last - 1
      end
      return first, last
    end
  end
end

local function skip_mermaid(direction)
  return function()
    local fallback = vim.v.count == 0 and ("g" .. direction) or direction
    if vim.v.count > 1 then
      return fallback
    end
    local buf = vim.api.nvim_get_current_buf()
    local row = vim.api.nvim_win_get_cursor(0)[1] - 1
    local step = direction == "j" and 1 or -1
    local first, last = mermaid_block(buf, row + step)
    if not first then
      return fallback
    end
    local target = direction == "j" and last or first
    if target == row + step then
      return fallback
    end
    return ("<Cmd>call cursor(%d, 1)<CR>"):format(target + 1)
  end
end

return {
  "folke/snacks.nvim",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function(event)
        for _, key in ipairs({ "j", "k" }) do
          vim.keymap.set("n", key, skip_mermaid(key), {
            buffer = event.buf,
            expr = true,
            silent = true,
            desc = "Move and skip mermaid diagrams",
          })
        end
      end,
    })
  end,
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
