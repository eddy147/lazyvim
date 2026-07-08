return {
  "milanglacier/minuet-ai.nvim",
  opts = {
    provider = "openai_compatible",
    provider_options = {
      openai_compatible = {
        api_key = "OPENAI_API_KEY",
        model = "gpt-4.1-mini",
        end_point = "https://api.openai.com/v1/chat/completions",
        stream = false,
      },
    },
    virtualtext = {
      auto_trigger_ft = { "*" },
        keymap = {
          accept = "<CR>",
          accept_line = "<A-a>",
          accept_n_lines = "<A-z>",
        prev = "<A-[>",
        next = "<A-]>",
        dismiss = "<A-e>",
      },
    },
  },
}
