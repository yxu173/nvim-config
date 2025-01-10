local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Initialize capabilities beforehand
local capabilities = vim.lsp.protocol.make_client_capabilities()
if pcall(require, 'cmp_nvim_lsp') then
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
end

require("lazy").setup({
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "Hoffs/omnisharp-extended-lsp.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")
      
      -- Disable other C# language servers first
      for _, server in ipairs({"csharp_ls", "omnisharp_mono"}) do
        if lspconfig[server] then
          lspconfig[server].setup({
            enabled = false,
            autostart = false
          })
        end
      end

      -- LSP configuration for C#
      lspconfig.omnisharp.setup({
        cmd = { 
          "dotnet",
          vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll",
          "--languageserver",
          "--hostPID",
          tostring(vim.fn.getpid())
        },
        root_dir = function(fname)
          return util.root_pattern(".sln", ".csproj", ".git")(fname) or vim.fn.getcwd()
        end,
        handlers = {
          ["textDocument/definition"] = function(...)
            local status, result = pcall(require('omnisharp_extended').handler, ...)
            if not status then
              return vim.lsp.handlers["textDocument/definition"](...)
            end
            return result
          end
        },
        capabilities = capabilities,
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = false,
        enable_roslyn_analyzers = false,
        organize_imports_on_format = false,
        enable_import_completion = false,
        sdk_include_prereleases = true,
        analyze_open_documents_only = false,
        filetypes = { "cs" },
        on_attach = function(client, bufnr)
          -- Avoid LSP client error notifications
          if not client.server_capabilities then return end

          local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
          end
          
          local opts = { noremap = true, silent = true }
          buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
          buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
          buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
          buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
          
          -- Optional: Enable formatting
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
          end
        end,
      })
    end,
  },
  -- Rest of your plugins...
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild && cmake --build build',
    shell = 'cmd.exe'
  },
  {
    "LazyVim/LazyVim",
    import = "lazyvim.plugins"
  },
  { import = "plugins" },
}, {
  ui = {
    border = "rounded",
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "catppuccin" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
