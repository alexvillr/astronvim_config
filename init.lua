local utils = require "astronvim.utils"

return {
  colorscheme = "catppuccin",

  plugins = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function() require("catppuccin").setup {} end,
    },
    {
      "folke/trouble.nvim",
      name = "Trouble",
      config = function() require("trouble").setup {} end,
    },
    {
      "kevinhwang91/nvim-bqf",
      event = { "BufRead", "BufNew" },
      config = function()
        require("bqf").setup {
          auto_enable = true,
          preview = {
            win_height = 12,
            win_vheight = 12,
            delay_syntax = 80,
            border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
          },
          func_map = {
            vsplit = "",
            ptogglemode = "z,",
            stoggleup = "",
          },
          filter = {
            fzf = {
              action_for = { ["ctrl-s"] = "split" },
              extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
            },
          },
        }
      end,
    },
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function() require("spectre").setup() end,
    },
    {
      "windwp/nvim-ts-autotag",
      config = function() require("nvim-ts-autotag").setup() end,
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "BufRead",
    },
    {
      "mrjones2014/nvim-ts-rainbow",
    },
    {
      "romgrk/nvim-treesitter-context",
      config = function()
        require("treesitter-context").setup {
          enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
          throttle = true, -- Throttles plugin updates (may improve performance)
          max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
          patterns = {
            -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = {
              "class",
              "function",
              "method",
            },
          },
        }
      end,
    },
    {
      "jbyuki/nabla.nvim",
      name = "nabla",
    },
    {
      "toppair/peek.nvim",
      name = "peek",
      build = "deno task --quiet build:fast",
      config = function()
        require("peek").setup() {
          auto_load = true, -- whether to automatically load preview when entering another markdown buffer
          close_on_bdelete = true, -- close preview window on buffer delete
          syntax = true, -- enable syntax highlighting, affects performance
          theme = "dark", -- 'dark' or 'light'
          update_on_change = true, -- whether or not to make updates as you change the file
          app = { "chromium", "--new-window" }, -- what app to open preview in
          filetype = { "markdown" }, -- list of filetypes to recognize as markdown relevant if update_on_change is true
          throttle_at = 200000, -- start throttling when file exceeds this amount of bytes in size
          throttle_time = "auto", -- minimum amount of time in milliseconds that has to pass before starting new render
        }
      end,
    },
    {
      "dccsillag/magma-nvim",
      name = "magma",
      lazy = false,
      build = ":UpdateRemotePlugins",
      config = function()
        vim.g.magma_automatically_open_output = false
        vim.g.magma_image_provider = "kitty"
      end,
    },
    {
      "mechatroner/rainbow_csv",
      name = "ranbow-csv",
    },
    {
      "mrcjkb/haskell-tools.nvim",
      name = "haskell-tools",
      config = function()
        local ht = require "haskell-tools"
        local bufnr = vim.api.nvim_get_current_buf()
        ht.dap.discover_configurations(bufnr)
        ht.start_or_attach {
          repl = {
            handler = "toggleterm", -- use toggleterm
          },
        }
      end,
    },
    {
      "simrat39/rust-tools.nvim",
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "rust_analyzer" },
      },
    },
    {
      "lervag/vimtex",
    },
    {
      "nvim-neorg/neorg",
      lazy = false,
      build = ":Neorg sync-parsers",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("neorg").setup {
          load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.dirman"] = { -- Manages Neorg workspaces
              config = {
                workspaces = {
                  notes = "~/neorg/notes",
                },
              },
            },
          },
        }
      end,
    },
    {
      "jalvesaq/Nvim-R",
    },
    {
      "goolord/alpha-nvim",
      opts = function(_, opts) -- override the options using lazy.nvim
        opts.section.header.val = { -- change the header section value
          "                                                                                   ",
          "     /\\__\\         /\\  \\         /\\  \\         /\\__\\          ___        /\\__\\     ",
          "    /::|  |       /::\\  \\       /::\\  \\       /:/  /         /\\  \\      /::|  |    ",
          "   /:|:|  |      /:/\\:\\  \\     /:/\\:\\  \\     /:/  /          \\:\\  \\    /:|:|  |    ",
          "  /:/|:|  |__   /::\\~\\:\\  \\   /:/  \\:\\  \\   /:/__/  ___      /::\\__\\  /:/|:|__|__  ",
          " /:/ |:| /\\__\\ /:/\\:\\ \\:\\__\\ /:/__/ \\:\\__\\  |:|  | /\\__\\  __/:/\\/__/ /:/ |::::\\__\\ ",
          " \\/__|:|/:/  / \\:\\~\\:\\ \\/__/ \\:\\  \\ /:/  /  |:|  |/:/  / /\\/:/  /    \\/__/~~/:/  / ",
          "     |:/:/  /   \\:\\ \\:\\__\\    \\:\\  /:/  /   |:|__/:/  /  \\::/__/           /:/  /  ",
          "     |::/  /     \\:\\ \\/__/     \\:\\/:/  /     \\::::/__/    \\:\\__\\          /:/  /   ",
          "     /:/  /       \\:\\__\\        \\::/  /       ~~~~         \\/__/         /:/  /    ",
          "     \\/__/         \\/__/         \\/__/                                   \\/__/     ",
          "                                                                                   ",
        }
      end,
    },
  },

  lsp = {
    setup_handlers = {
      rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
    },
    config = {
      clangd = {
        capabilities = { offsetEncoding = "utf-8" },
      },
    },
    formatting = {
      format_on_save = {
        enabled = true, -- enable format on save
        ignore_filetypes = { -- disable format on save for specified filetypes
          "markdown",
          "python",
          "c",
        },
      },
    },
  },

  mappings = {
    -- normal mode
    n = {
      -- Open trouble
      ["<leader>T"] = { "<cmd>Trouble<cr>", desc = "Trouble" },
      -- adding ghci repl to terminal
      ["<leader>tg"] = {
        function() utils.toggle_term_cmd({ vim.fn.executable "ghci" == 1 } and "ghci") end,
        desc = "ToggleTerm ghci",
      },
      -- Go to home screen when closing last buffer
      ["<leader>c"] = {
        function()
          local bufs = vim.fn.getbufinfo { buflisted = true }
          require("astronvim.utils.buffer").close(0)
          if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
        end,
        desc = "Close buffer",
      },
      -- haskell-tools
      ["<leader>H"] = { name = " Haskell" },
      ["<leader>Hc"] = {
        function() vim.lsp.codelens.run() end,
        desc = "Haskell Code Lens",
      },
      ["<leader>Hs"] = {
        function() require("haskell-tools").hoogle.hoogle_signature() end,
        desc = "Hoogle",
      },
      ["<leader>Hl"] = {
        function() require("haskell-tools").lsp.buf_eval_all() end,
        desc = "lsp",
      },
      -- Magma Key Bindings
      ["<leader>j"] = { name = " Jupyter" },
      ["<leader>ji"] = { "<cmd> MagmaInit<cr>", desc = "Initialise Magma" },
      ["<leader>jI"] = { "<cmd> MagmaDeinit<cr>", desc = "Deinitialise Magma" },
      ["<leader>jr"] = { "<cmd> MagmaEvaluateOperator<cr>", desc = "Evaluate Operator" },
      ["<leader>jj"] = { "<cmd> MagmaEvaluateLine<cr>", desc = "Evaluate Line" },
      ["<leader>jc"] = { "<cmd> MagmaReevaluateCell<cr>", desc = "Reevaluate Cell" },
      ["<leader>jd"] = { "<cmd> MagmaDelete<cr>", desc = "Delete Cell" },
      ["<leader>jo"] = { "<cmd> MagmaShowOutput<cr>", desc = "Show Cell" },
      ["<leader>jK"] = { "<cmd> MagmaInterrupt<cr>", desc = "Interrupt Kernel" },
      ["<leader>jR"] = { "<cmd> MagmaRestart!<cr>", desc = "Restart Kernel" },
      -- Markdown Key Bindings
      ["<leader>m"] = { name = " Markdown" },
      ["<leader>mn"] = { "<cmd> lua require('nabla').enable_virt()<CR>", desc = "enable nabla" },
      ["<leader>mN"] = { "<cmd> lua require('nabla').disable_virt()<CR>", desc = "disable nabla" },
      ["<leader>mm"] = { "<cmd> lua require('nabla').popup({'rounded'})<CR>", desc = "nabla popup" },
      ["<leader>mp"] = { "<cmd> lua require('nabla').toggle_virt()<CR>", desc = "toggle nabla vert" },
      ["<leader>mG"] = { "<cmd> Glow<CR>", desc = "Glow" },
      ["<leader>mo"] = { "<cmd> lua require('peek').open()<CR>", desc = "Peek Open" },
      ["<leader>mc"] = { "<cmd> lua require('peek').close()<CR>", desc = "Peek Close" },
      -- Buffer Key Bindings
      ["H"] = {
        function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      },
      ["L"] = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      },
    },
    -- select mode
    x = {
      ["<leader>j"] = { "<cmd> MagmaEvaluateVisual<cr>", desc = "Jupyter Evaluate Block" },
    },
  },
}
