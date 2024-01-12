local MarkdownPreview = {}

local function getGlobalConfig()
    return {
        pdfViewer = vim.g.markdown_preview_pdf_viewer or "zathura",
        pandocArgs = vim.g.markdown_preview_pandoc_args or ""
    }
end

local function compileMarkdownToPDF(config)
    local filePath = vim.fn.expand("%:p")
    local pdfPath = vim.fn.expand("%:p:r") .. ".pdf"
    local pandocCommand = "pandoc " .. config.pandocArgs .. " " .. vim.fn.shellescape(filePath) .. " -o " .. vim.fn.shellescape(pdfPath)

    os.execute(pandocCommand)
end

local function openPDF(config)
    local pdfPath = vim.fn.expand("%:p:r") .. ".pdf"
    os.execute(config.pdfViewer .. " " .. vim.fn.shellescape(pdfPath) .. " &")
end

function MarkdownPreview.startPreview()
    local config = getGlobalConfig()
    compileMarkdownToPDF(config)
    openPDF(config)
end

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = {"*.md", "*.markdown", "*.pandoc"},
    callback = function()
        local config = getGlobalConfig()
        compileMarkdownToPDF(config)
    end,
})

vim.api.nvim_create_user_command("MdPreview", MarkdownPreview.startPreview, {})

return MarkdownPreview
