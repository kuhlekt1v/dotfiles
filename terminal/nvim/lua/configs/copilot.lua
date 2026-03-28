local M = {}

function M.setup()
  local chat = require("CopilotChat")

  local user =  vim.env.USER or "User"

  local opts = {
    question_header = user,
    answer_header = "Copilot ",
    error_header = "## Error ",
  }

  opts.prompts = {
    Commit = {
      prompt = '> #git:staged\n\nWrite commit message with commitizen convention explaining WHAT and WHY.',
    },
  }

  chat.setup(opts)
end

return M
