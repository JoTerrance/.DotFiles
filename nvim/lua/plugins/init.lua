local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local vscode = vim.g.vscode == 1
  -- Lazy can manage itself
require("lazy").setup({
  'wbthomason/packer.nvim',
  'ibhagwan/smartyank.nvim',
  'mg979/vim-visual-multi',
  'Civitasv/cmake-tools.nvim',
--  'skywind3000/asyncrun.vim',
  'debugloop/telescope-undo.nvim',
  'https://codeberg.org/esensar/nvim-dev-container',
  'lpoto/telescope-docker.nvim',
  'williamboman/mason.nvim',
  'nvimtools/none-ls.nvim',
  "jay-babu/mason-null-ls.nvim",
  'mfussenegger/nvim-dap',
  'jayp0521/mason-nvim-dap.nvim',
  {'VonHeikemen/lsp-zero.nvim'},
  'lewis6991/impatient.nvim',
  {'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim'},
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = function() require("treesitter-config") end, enabled = not vscode},
  {'tamton-aquib/staline.nvim', dependencies = {'kyazdani42/nvim-web-devicons',lazy = true} },
  {"LinArcX/telescope-command-palette.nvim" },
--  {'nat-418/telescope-color-names.nvim', config = function() require('telescope').load_extension('color_names') end, enabled = not vscode},
  {"neanias/telescope-lines.nvim", dependencies = "nvim-telescope/telescope.nvim",},
  {'akinsho/bufferline.nvim',version="*", dependencies = 'kyazdani42/nvim-web-devicons'},
  {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' },
  {'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter" },
  {'HiPhish/nvim-ts-rainbow2', after = "nvim-treesitter" },
  {'windwp/nvim-autopairs', config = true, event="InsertEnter", after = "nvim-cmp", enabled = not vscode},
  {'folke/which-key.nvim', event = "BufWinEnter", config = function() require('whichkey-config') end, enabled = not vscode },
  'nvim-telescope/telescope.nvim',
  'LinArcX/telescope-env.nvim',
  'williamboman/mason-lspconfig.nvim',
  { 'neovim/nvim-lspconfig', requires = {'williamboman/mason.nvim','williamboman/mason-lspconfig.nvim','j-hui/fidget.nvim', }, },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-nvim-lsp-document-symbol',
  'f3fora/cmp-spell',
  'uga-rosa/cmp-dictionary',
  {"Dosx001/cmp-commit", requires = "hrsh7th/nvim-cmp"},
  {"hrsh7th/nvim-cmp", requires = {"KadoBOT/cmp-plugins", config = function() require("cmp-plugins").setup({ files = { ".*\\.lua" }  }) end, }},
  {'quangnguyen30192/cmp-nvim-tags', ft = {'kotlin','java'} },
  'folke/lua-dev.nvim',
  'folke/trouble.nvim',
  'monaqa/dial.nvim',
  'ggandor/leap.nvim',
  'ggandor/leap-ast.nvim',
  'ggandor/leap-spooky.nvim',
  'cwebster2/github-coauthors.nvim',
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  -- opts = {},
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'lukas-reineke/cmp-rg',
  'hrsh7th/vim-vsnip-integ',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  {'David-Kunz/cmp-npm', requires = {'nvim-lua/plenary.nvim' } },
  'tamago324/cmp-zsh',
  'norcalli/nvim-colorizer.lua',
  'lewis6991/gitsigns.nvim',
  'kdheepak/lazygit.nvim',
 -- {'tanvirtin/vgit.nvim', config = function() require('vgit').setup() end, enabled = not vscode },
  'echasnovski/mini.nvim',
  {"simrat39/symbols-outline.nvim", config = function() require("symbols-outline").setup() end, enabled = not vscode },
  'glepnir/dashboard-nvim',
  {'lukas-reineke/indent-blankline.nvim', main = "ibl"},
  {'akinsho/toggleterm.nvim', branch = 'main', config = function() require('toggleterm-config') end, enabled = not vscode },
  {'numToStr/Comment.nvim', config = function() require('Comment') end, enabled = not vscode },
  'jeffkreeftmeijer/vim-numbertoggle',
  {'glepnir/lspsaga.nvim', branch = "main" },
  {'folke/zen-mode.nvim', config = function() require("zen-mode-config") end, enabled = not vscode },
  {'folke/twilight.nvim', config = function() require("twilight-config") end, enabled = not vscode },
--  {'beauwilliams/focus.nvim', config = function() require("focus").setup() end, enabled = not vscode},
--  'szw/vim-maximizer',
  'lambdalisue/suda.vim',
-- 'puremourning/vimspector',
  'Shougo/vimproc.vim',
  'hashivim/vim-terraform',
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-treesitter/playground',
  'kyazdani42/nvim-web-devicons',
  'scalameta/nvim-metals',
  'sudormrfbin/cheatsheet.nvim',
  'romgrk/nvim-treesitter-context',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'RRethy/nvim-treesitter-textsubjects',
  'github/copilot.vim',
  'eandrju/cellular-automaton.nvim',
  {'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp'},
--  { 'codota/tabnine-nvim', build = "./dl_binaries.sh", enabled = not vscode },
  'ray-x/cmp-treesitter',
  'ray-x/lsp_signature.nvim',
  'octaltree/cmp-look',
  'crispgm/telescope-heading.nvim',
  'nvim-telescope/telescope-packer.nvim',
  'nvim-telescope/telescope-vimspector.nvim',
  'fannheyward/telescope-coc.nvim',
  'axieax/urlview.nvim',
  'mfussenegger/nvim-lint',
  'rcarriga/nvim-dap-ui',
  'rcarriga/nvim-notify',
  'rcarriga/cmp-dap',
  'theHamsta/nvim-dap-virtual-text',
  'nvim-telescope/telescope-dap.nvim',
  'ravenxrz/DAPInstall.nvim',
  'mbbill/undotree',
  'voldikss/vim-translator',
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  'chipsenkbeil/distant.nvim',
  'ms-jpq/coq_nvim',
  'mfussenegger/nvim-dap-python',
  'mfussenegger/nvim-jdtls',
  'nvim-telescope/telescope-media-files.nvim',
  {'nvim-telescope/telescope-z.nvim', requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-lua/popup.nvim' }, { 'nvim-telescope/telescope.nvim' } } },
  'softinio/scaladex.nvim',
  'onsails/lspkind-nvim',
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  'rafamadriz/friendly-snippets',
  'kitagry/vs-snippets',
  'petertriho/cmp-git',
  'TC72/telescope-tele-tabby.nvim',
  'tjdevries/complextras.nvim',
--  'folke/tokyonight.nvim',
  'Mofiqul/vscode.nvim',
  { 'nvim-lualine/lualine.nvim', enabled = not vscode },
  'unblevable/quick-scope',
  'tamago324/telescope-openbrowser.nvim',
  'tyru/open-browser.vim',
  'camgraff/telescope-tmux.nvim',
  'norcalli/nvim-terminal.lua',
  'danielpieper/telescope-tmuxinator.nvim',
  'ThePrimeagen/refactoring.nvim',
  'fcying/telescope-ctags-outline.nvim',
  'jvgrootveld/telescope-zoxide',
  'dhruvmanila/telescope-bookmarks.nvim',
  'nvim-telescope/telescope-github.nvim',
  'cljoly/telescope-repo.nvim',
  'LinArcX/telescope-changes.nvim',
  {"kylechui/nvim-surround", version = "*" },
  {"AckslD/nvim-neoclip.lua", config = function() require('neoclip').setup() end, enabled = not vscode },
  'L3MON4D3/LuaSnip',
  { 'saadparwaiz1/cmp_luasnip' },
  'kristijanhusak/vim-carbon-now-sh',
  'pwntester/octo.nvim',
  {'https://git.sr.ht/~whynothugo/lsp_lines.nvim', config = true, enabled = not vscode},
  'sam4llis/nvim-lua-gf',
-- { 'anuvyklack/windows.nvim', dependencies = { 'anuvyklack/middleclass', 'anuvyklack/animation.nvim' },
--    config = function()  vim.o.winwidth = 20 vim.o.winminwidth = 10 vim.o.equalalways = false
--      require('windows').setup()  end, disable = vscode
--  },
  {'neoclide/coc.nvim', branch = 'release', disable = vscode, cond = function() return vim.g.vscode ~= nil end },
  { 'kevinhwang91/nvim-bqf' },
  { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end },
  {'danymat/neogen', config = function() require('neogen').setup {} end, disable = vscode },
})

