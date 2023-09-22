return {


  

    {"maxmellon/vim-jsx-pretty", lazy = false },

  {
    "Luxed/ayu-vim", 
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    config = function()
    
    end,
  },
  { "adrian5/oceanic-next-vim", lazy = false, -- make sure we load this during startup if it is your main colorscheme
     },

{'SirVer/ultisnips', lazy = false, -- make sure we load this during startup if it is your main colorscheme
   },
{'honza/vim-snippets', lazy = false, -- make sure we load this during startup if it is your main colorscheme
  },
  
{'natebosch/dartlang-snippets', lazy = false, -- make sure we load this during startup if it is your main colorscheme
  },
{'tpope/vim-projectionist', lazy = false, -- make sure we load this during startup if it is your main colorscheme
  },
{'jiangmiao/auto-pairs', lazy = false, -- make sure we load this during startup if it is your main colorscheme
  },
  

{
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
},

  {
  'weilbith/nvim-code-action-menu',
  cmd = 'CodeActionMenu',
},


  {"rebelot/kanagawa.nvim",    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,},

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}
