# Neovim Markdown Preview Plugin

This plugin allows Neovim users to preview Markdown files as PDFs using Pandoc and a configurable PDF viewer.

- Compile Markdown files to PDF using Pandoc.
- Open the compiled PDF with a configurable PDF viewer.

## Requirements
- Neovim 0.5+
- Pandoc
- A PDF viewer (Zathura is the default)

## Installation
Simply add the following to your favorite plugin manager:
`benjaminshawki/markdown-preview`

## Usage
Then use the command `:MdPreview` to compile the current Markdown file to PDF and open it with the configured PDF viewer.

Zathura is the default PDF viewer, but you can change it by setting the global variable `markdown_preview_pdf_viewer` to your preferred PDF viewer.
I have only tested this plugin with Zathura, so I can't guarantee that it will work with other PDF viewers. But it should work with any PDF viewer that can open a PDF file from the command line using `<pdf_viewer> <pdf_file>`.

## Configuration

Set global variables in your `init.lua` or `.vimrc` to configure the plugin:

Example of configuration for For Neovim's init.lua
```lua
-- Replace with your preferred PDF viewer
vim.g.markdown_preview_pdf_viewer = "zathura"

-- Since I use a bibliography file, I need to set the path to it
local function set_bibliography_path()
    local file_path = vim.fn.expand('%:p')
    local file_dir = vim.fn.fnamemodify(file_path, ':h')
    vim.g.markdown_preview_pandoc_args = '--bibliography=' .. file_dir .. '/ref.bib --citeproc'
end
```
