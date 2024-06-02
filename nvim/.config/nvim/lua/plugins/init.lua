return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
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
        "javascript",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
      },
    },
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recomended as each new version will have breaking changes
    opts = {
      --Config goes here
    },
    {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        -- your configuration comes here
        -- or leave it empty ;to use the default settings
        -- refer to the configuration section below
      },
      lazy = false,
    },
    {
      "hrsh7th/nvim-cmp",
      -- opts = overrides.cmp,

      dependencies = {
        {
          -- snippet plugin
          "L3MON4D3/LuaSnip",
          config = function(_, opts)
            -- load default luasnip config;
            -- require("plugins.configs.others").luasnip(opts)

            local luasnip = require "luasnip"
            luasnip.filetype_extend("javascriptreact", { "html" })
            luasnip.filetype_extend("typescriptreact", { "react-ts", "typescript", "html" })
            luasnip.filetype_extend("javascriptreact", { "react", "javascript", "html" })
            luasnip.filetype_extend("javascript", { "react" })
            luasnip.filetype_extend("vue", { "html" })
            require("luasnip/loaders/from_vscode").lazy_load()
          end,
        },
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {
        cursor_scrolls_alone = false,
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
      }
    end,
    lazy = false,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require("rainbow-delimiters.setup").setup {
        strategy = {
          -- ...
        },
        query = {
          -- ...
        },
        highlight = {
          "RainbowDelimiterPurple",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          -- "RainbowDelimiterViolet",
          -- "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    lazy = false,
  },
  -- {
  --   'arnamak/stay-centered.nvim'
  -- },
  -- {
  --   "epwalsh/obsidian.nvim",
  --   version = "*", -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   ft = "markdown",
  --   -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  --   -- event = {
  --   --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   --   "BufReadPre path/to/my-vault/**.md",
  --   --   "BufNewFile path/to/my-vault/**.md",
  --   -- },
  --   dependencies = {
  --     -- Required.
  --     "nvim-lua/plenary.nvim",
  --
  --     -- see below for full list of optional dependencies 👇
  --   },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = "personal",
  --         path = "~/Obsidian Vault",
  --       },
  --       -- {
  --       --   name = "work",
  --       --   path = "~/vaults/work",
  --       -- },
  --     },
  --
  --     -- see below for full list of options 👇
  --   },
  -- },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      { "<leader>A", function() require("harpoon"):list():add() end,    desc = "harpoon file", },
      { "<leader>r", function() require("harpoon"):list():remove() end, desc = "harpoon file", },
      {
        "<leader>a",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
      { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
      { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
      { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
      { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
    },
  },
}
