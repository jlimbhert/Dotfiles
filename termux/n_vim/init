-- =====================================================
-- NVIM PYTHON – CONFIG MEJORADA (TERMUX)
-- =====================================================

-- ======================
-- OPCIONES BÁSICAS
-- ======================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.mouse = "a"

vim.g.mapleader = " "

-- ======================
-- ATAJOS
-- ======================
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>o', ':wq<CR>')

vim.keymap.set('n', '<leader>n', ':bn<CR>')
vim.keymap.set('n', '<leader>p', ':bp<CR>')
vim.keymap.set('n', '<leader>d', ':bd<CR>')
vim.keymap.set('n', '<leader>x', ':qa<CR>')

-- Navegación LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)

-- ======================
-- LAZY.NVIM
-- ======================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  "neovim/nvim-lspconfig",

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  "vim-python/python-syntax",

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",

  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
})

-- ======================
-- 🎨 TEMA PERSONALIZADO
-- ======================
vim.cmd("colorscheme evening")

vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e", fg = "#ffffff" })

vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffd75f", bold = true })

vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", italic = true })
vim.api.nvim_set_hl(0, "String", { fg = "#ffd75f" })
vim.api.nvim_set_hl(0, "Keyword", { fg = "#ff5f5f", bold = true })
vim.api.nvim_set_hl(0, "Function", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#ffffff" })

vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff0000" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#ffaa00" })

-- ======================
-- PYTHON SYNTAX
-- ======================
vim.g.python_highlight_all = 1
vim.g.python_highlight_string_formatting = 1
vim.g.python_highlight_string_format = 1
vim.g.python_highlight_string_templates = 1

-- ======================
-- AUTOCOMPLETADO (CMP)
-- ======================
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})

-- ======================
-- LSP PYRIGHT
-- ======================
vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
      },
    },
  },
})

vim.lsp.enable("pyright")

-- ======================
-- DIAGNÓSTICOS
-- ======================
vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = "●",
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

-- ======================
-- 🧠 FORMATEO REAL CON BLACK
-- ======================

-- Formatear manual con recarga automática
vim.keymap.set('n', '<leader>f', function()
  vim.cmd("!black %")
  vim.cmd("edit")
end)

-- Formatear automáticamente al guardar (solo Python)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.cmd("silent! !black %")
    vim.cmd("edit")
  end,
})
