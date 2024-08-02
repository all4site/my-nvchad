local lazy = require "lazy"
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint-lsp",
        "typescript-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "tsx",
      },
      highlight = {
        -- enable = false,
        disable = { "tsx", "typescript" },
      },
    },
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    branch = "v2", -- optional but strongly recommended
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  -- {
  --   "folke/trouble.nvim",
  --   lazy = false,
  --   cmd = { "TroubleToggle", "Trouble" },
  --   config = function()
  --     require("trouble").setup {
  --       modes = {
  --         preview_float = {
  --           mode = "diagnostics",
  --           preview = {
  --             type = "float",
  --             relative = "editor",
  --             border = "rounded",
  --             title = "Preview",
  --             title_pos = "center",
  --             position = { 0, -2 },
  --             size = { width = 0.3, height = 0.3 },
  --             zindex = 200,
  --           },
  --         },
  --       },
  --     }
  --   end,
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  -- ,
  {
    "Exafunction/codeium.vim",
    lazy = false,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "numToStr/Comment.nvim",
    lazy = "VeryLazy",
    cmd = { "CommentToggle", "Comment" },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup {
        user_default_options = {
          mode = "background",
        },
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      require("nvchad.configs.nvimtree").options,

      view = {
        adaptive_size = true,
      },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("typescript-tools").setup {
        settings = {
          tsserver_plugins = {
            "@styled/typescript-styled-plugin",
          },
        },
      }
    end,
  },
}
