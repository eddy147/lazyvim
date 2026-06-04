return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      opts.linters.plantuml_check = {
        cmd = "plantuml",
        args = { "-syntax" },
        stdin = true,
        append_fname = false,
        ignore_exitcode = true,
        stream = "stdout",
        condition = function()
          return vim.fn.executable("plantuml") == 1
        end,
        parser = function(output)
          local diagnostics = {}
          local lines = vim.split(vim.trim(output or ""), "\n", { trimempty = true })

          if #lines == 0 or lines[1] == "OK" then
            return diagnostics
          end

          local i = 1
          while i <= #lines do
            local kind = lines[i]
            local lnum = tonumber(lines[i + 1] or "1") or 1
            local message = lines[i + 2] or "PlantUML syntax error"

            if kind == "ERROR" or kind == "WARNING" then
              table.insert(diagnostics, {
                lnum = math.max(lnum - 1, 0),
                col = 0,
                severity = kind == "WARNING" and vim.diagnostic.severity.WARN or vim.diagnostic.severity.ERROR,
                source = "plantuml",
                message = message,
              })
              i = i + 3
            else
              i = i + 1
            end
          end

          return diagnostics
        end,
      }

      opts.linters_by_ft = opts.linters_by_ft or {}
      local ft_linters = opts.linters_by_ft.plantuml or {}
      if not vim.tbl_contains(ft_linters, "plantuml_check") then
        table.insert(ft_linters, "plantuml_check")
      end
      opts.linters_by_ft.plantuml = ft_linters
    end,
  },
}
