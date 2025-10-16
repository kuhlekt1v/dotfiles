local M = {}

M.setup = function()
    local ok, nvimtree = pcall(require, "nvim-tree")
    if not ok then
        vim.notify("nvim-tree not found!", vim.log.levels.WARN)
        return
    end

    local api = require("nvim-tree.api")
    local image_preview = require("image_preview")

    -- Helper: check if file is an image
    local function is_image(path)
        if not path or type(path) ~= "string" then
            return false
        end
        -- extract last extension part, case-insensitive
        local ext = path:match("%.([^.\\/:]+)$")
        if not ext then
            return false
        end
        ext = ext:lower()
        local image_exts = {
            png = true,
            jpg = true,
            jpeg = true,
            gif = true,
            bmp = true,
            webp = true,
            tiff = true,
            tif = true,
            svg = true,
            avif = true,
            heic = true,
        }
        return image_exts[ext] or false
    end
    -- Function: preview image under cursor
    local function preview_image()
        local node = api.tree.get_node_under_cursor()
        if not node or node.type ~= "file" then
            return
        end

        local path = node.absolute_path
        if not is_image(path) then
            vim.notify("Not an image file", vim.log.levels.INFO)
            return
        end

        image_preview.PreviewImage(path)
    end

    -- Register keymap inside NvimTree buffers
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "NvimTree",
        callback = function(args)
            vim.keymap.set("n", "<leader>i", preview_image, {
                desc = "Preview image in wezterm/kitty",
                buffer = args.buf,
                silent = true,
                noremap = true,
            })
        end,
    })

    -- Run default NvChad nvim-tree setup (if needed)
    nvimtree.setup({})
end

return M
