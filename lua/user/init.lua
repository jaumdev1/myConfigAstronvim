return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily  add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "tokyonight",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  }, 

lsp = {
  -- customize lsp formatting options
  formatting = {
    -- control auto formatting on save
    format_on_save = {
      enabled = true, -- enable or disable format on save globally
      allow_filetypes = { -- enable format on save for specified filetypes only
        "lua",
        "c",
        "cpp",
          
      },
      ignore_filetypes = { -- disable format on save for specified filetypes
        -- "python",
      },
    },
    disabled = { -- disable formatting capabilities for the listed language servers
      -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
      -- "lua_ls",
    },
    timeout_ms = 1000, -- default format timeout
    -- filter = function(client) -- fully override the default formatting function
    --   return true
    -- end
  },
  config = {
    clangd = {
      capabilities = {
        offsetEncoding = "utf-8",
      },
    },
  },
  -- enable servers that you already have installed without mason
  servers = {
    "clangd"
  },
}, 

plugins = {
  {
    "p00f/clangd_extensions.nvim", 
    init = function()
      local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        desc = "Load clangd_extensions with clangd",
        callback = function(args)
          if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
            require "clangd_extensions"
            vim.api.nvim_del_augroup_by_id(augroup) 
          end
        end,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clangd" }, 
    },
  },
},

lazy = {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
    },
  },

  polish = function()
    local lspconfig = require('lspconfig')
    lspconfig.clangd.setup{
      capabilities = lspconfig.common_capabilities,
    }
  end,
}
}

