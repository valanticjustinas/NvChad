local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      require "custom.configs.dap"
    end,
    dependencies = {
      -- Install the vscode-js-debug adapter
      {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
        version = "1.*",
      },
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require "custom.configs.vscode-js-debug"
        end,
      },
      {
        "rcarriga/nvim-dap-ui",
        keys = {
          {
            "<leader>du",
            function()
              require("dapui").toggle()
            end,
            silent = true,
          },
        },
        opts = {
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
        },
        config = function(_, opts)
          local dapui = require "dapui"
          local dap = require "dap"

          require("dapui").setup(opts)

          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },
    },
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- ,

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
