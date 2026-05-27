return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      npairs.setup({})

      npairs.add_rules({
        -- when typing "do" and then Enter, insert a newline, an indented cursor, newline and "end"
        Rule("do$", "end", "elixir")
          :use_regex(true)
          :replace_endpair(function()
            return "\n\t\nend"
          end)
          -- optionally make it trigger only on <CR>:
          :with_move(function()
            return false
          end),
      })
    end,
  },
}
