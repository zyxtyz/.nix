{ pkgs, config, ... }:
let
  allServers = [
    "asm_lsp"
    "clangd"
    "ccls"
    "tsserver"
    "html"
    "cssls"
    "jsonls"
    "eslint"
    "tailwindcss"
    "svelte"
    "volar"
    "vtsls"
    "pyright"
    "pylsp"
    "jdtls"
    "java_language_server"
    "omnisharp"
    "csharp_ls"
    "rust_analyzer"
    "gopls"
    "hls"
    "lua_ls"
    "phpactor"
    "solargraph"
    "ruby_lsp"
    "sourcekit"
    "kotlin_language_server"
    "sqls"
    "postgres_lsp"
    "yamlls"
    "taplo"
    "lemminx"
    "marksman"
    "nil_ls"
    "nixd"
  ];
in
{

  environment.systemPackages = with pkgs; [
    nodePackages.prettier
    black
    stylua
    rust-analyzer
    pyright
  ];

  programs.nixvim = {
    enable = true;

    plugins = {
      # Enable LSP servers
      lsp = {
        enable = true;
        servers = builtins.listToAttrs (
          map (srv: {
            name = srv;
            value = {
              enable = true;
            };
          }) allServers
        );
      };

      # Enable cmp completion with sources via settings
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
        };
      };

      luasnip = {
        enable = true;
      };

      lspkind = {
        enable = true;
      };

      # null-ls integration (called none-ls in nixvim)

      # Optional UI helpers
      lspsaga = {
        enable = true;
      };

      noice = {
        enable = true;
      };
    };

    # Autoformat on save
    extraConfigLua = ''
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end
      })
    '';
  };
}
