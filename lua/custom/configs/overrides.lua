local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.dap_ui = {
  icons = { expanded = "∩â¥", collapsed = "∩âÜ", circular = "∩äÉ" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        { id = "repl", size = 0.30 },
        { id = "console", size = 0.70 },
      },
      size = 0.19,
      position = "bottom",
    },
    {
      elements = {
        { id = "scopes", size = 0.30 },
        { id = "breakpoints", size = 0.20 },
        { id = "stacks", size = 0.10 },
        { id = "watches", size = 0.30 },
      },
      size = 0.20,
      position = "right",
    },
  },
  floating = {
    max_height = 0.9,
    max_width = 0.5,
    border = vim.g.border_chars,
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
}

return M
