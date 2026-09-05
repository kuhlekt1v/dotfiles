local M = {}

function M.close_other_buffers()
    local current = vim.api.nvim_get_current_buf()

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
            local bt = vim.api.nvim_get_option_value("buftype", { buf = buf })
            if bt == "" then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end
end

function M.close_all_buffers()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
            local bt = vim.api.nvim_get_option_value("buftype", { buf = buf })

            if bt == "" then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end
end

return M
