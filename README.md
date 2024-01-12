# Neovim Markdown Preview Plugin

This plugin allows Neovim users to preview Markdown files as PDFs using Pandoc and a configurable PDF viewer.

## Features

- Compile Markdown files to PDF using Pandoc.
- Open the compiled PDF with a configurable PDF viewer.

## Configuration

Set global variables in your `init.lua` or `.vimrc` to configure the plugin:

Example of configuration for For Neovim's init.lua
```lua
-- Replace with your preferred PDF viewer
vim.g.markdown_preview_pdf_viewer = "zathura"

-- since I use a bibliography file, I need to set the path to it
local function set_bibliography_path()
    local file_path = vim.fn.expand('%:p')
    local file_dir = vim.fn.fnamemodify(file_path, ':h')
    vim.g.markdown_preview_pandoc_args = '--bibliography=' .. file_dir .. '/ref.bib --citeproc'
end
```
