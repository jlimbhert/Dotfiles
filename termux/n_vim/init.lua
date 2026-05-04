-- =====================================================
-- NVIM CONFIG PERSONAL (PYTHON + BASH - TERMUX)
-- =====================================================

vim.g.lsp_log_level = "off"
vim.notify = function() end

----------------------
-- ⚙️ OPCIONES BÁSICAS
----------------------
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

----------------------
-- ⌨️ KEYMAPS OPTIMIZADOS
----------------------
local map = vim.keymap.set

-- básicos
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>x", "<cmd>qa<cr>")
map("n", "<leader>o", "<cmd>wq<cr>")

-- buffers (tu estilo)
map("n", "<leader>v", "<cmd>bnext<cr>")
map("n", "<leader>m", "<cmd>bprevious<cr>")
map("n", "<leader>d", "<cmd>bdelete<cr>")

-- guardar rápido
map("n", "<leader>vv", "<cmd>w<cr>")

-- abrir archivo escribiendo ruta
map("n", "<leader>e", ":e ")

-- diagnósticos
map("n", "<leader>l", vim.diagnostic.open_float)

-- LSP navegación
map("n", "gd", vim.lsp.buf.definition)
map("n", "K", vim.lsp.buf.hover)
map("n", "gr", vim.lsp.buf.references)

-- explorador
map("n", "<C-n>", "<cmd>Ex<cr>")

-- terminal
map("n", "<C-t>", function()
  vim.cmd("split | terminal")
end)

map("t", "<Esc>", [[<C-\><C-n>]])

----------------------
-- 📦 LAZY.NVIM
----------------------
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

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  "vim-python/python-syntax",
})

----------------------
-- 🧠 AUTOCOMPLETADO
----------------------
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

----------------------
-- 🐍 LSP PYTHON + 🐚 BASH
----------------------
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
      },
    },
  },
})

lspconfig.bashls.setup({
  capabilities = capabilities,
})

----------------------
-- ⚠️ DIAGNÓSTICOS
----------------------
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

----------------------
-- 💾 FORMATEO
----------------------
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

----------------------
-- 🎨 TEMA
----------------------
vim.cmd("colorscheme default")

vim.api.nvim_set_hl(0, "Normal", { bg = "#1c1c1c", fg = "#e5e5e5" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffd75f", bold = true })

vim.api.nvim_set_hl(0, "Comment", { fg = "#8a8a8a", italic = true })
vim.api.nvim_set_hl(0, "String", { fg = "#ffd75f" })
vim.api.nvim_set_hl(0, "Function", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "Keyword", { fg = "#ff5f5f", bold = true })

vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff4d4d" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#ffb84d" })

vim.api.nvim_set_hl(0, "Statement", { fg = "#ff5f5f" })
