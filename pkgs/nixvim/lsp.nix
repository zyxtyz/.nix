 { pkgs, config, ... }:
let
    allServers = [
    "aiken" "air" "angularls" "ansiblels" "arduino_language_server" "asm_lsp" "ast_grep"
    "astro" "atlas" "autotools_ls" "ballerina" "basedpyright" "bashls" "beancount"
    "biome" "bitbake_language_server" "blueprint_ls" "buck2" "buf_ls" "ccls" "clangd"
    "clojure_lsp" "cmake" "crystalline" "csharp_ls" "cssls" "cue" "dafny" "dagger"
    "dartls" "denols" "dhall_lsp_server" "diagnosticls" "digestif" "docker_compose_language_service"
    "dockerls" "dolmenls" "dotls" "dprint" "earthlyls" "efm" "elixirls" "elmls" "elp"
    "emmet_language_server" "emmet_ls" "erg_language_server" "erlangls" "eslint"
    "fennel_ls" "fish_lsp" "flow" "fortls" "fsautocomplete" "fstar" "futhark_lsp" "ghcide"
    "gitlab_ci_ls" "gleam" "glsl_analyzer" "glslls" "golangci_lint_ls" "gopls" "harper_ls"
    "helm_ls" "hls" "html" "htmx" "hyprls" "idris2_lsp" "java_language_server" "jdtls"
    "jedi_language_server" "jqls" "jsonls" "jsonnet_ls" "just" "koka" "kotlin_language_server"
    "leanls" "lemminx" "lexical" "lsp_ai" "ltex" "lua_ls" "luau_lsp" "markdown_oxide"
    "marksman" "matlab_ls" "mesonlsp" "metals" "mint" "mlir_lsp_server" "mlir_pdll_lsp_server"
    "muon" "neocmake" "nextls" "nginx_language_server" "nickel_ls" "nil_ls" "nim_langserver"
    "nimls" "nixd" "nushell" "ocamllsp" "ols" "omnisharp" "openscad_lsp" "oxlint" "perlnavigator"
    "perlpls" "pest_ls" "phan" "phpactor" "postgres_lsp" "protols" "psalm" "pylsp" "pylyzer"
    "pyright" "qmlls" "quick_lint_js" "regal" "regols" "rescriptls" "rls" "rubocop" "ruby_lsp"
    "ruff" "rune_languageserver" "rust_analyzer" "scheme_langserver" "serve_d" "shopify_theme_ls"
    "slint_lsp" "solargraph" "solc" "sourcekit" "spectral" "sqls" "standardrb" "starlark_rust"
    "starpls" "statix" "stylelint_lsp" "superhtml" "svelte" "svls" "swift_mesonls" "syntax_tree"
    "systemd_ls" "tailwindcss" "taplo" "tblgen_lsp_server" "teal_ls" "templ" "terraform_lsp"
    "terraformls" "texlab" "tflint" "thriftls" "tilt_ls" "tinymist" "ts_ls" "ts_query_ls"
    "ttags" "typeprof" "typos_lsp" "uiua" "vacuum" "vala_ls" "vale_ls" "vectorcode_server"
    "verible" "veryl_ls" "vhdl_ls" "vimls" "vls" "volar" "vtsls" "wgsl_analyzer" "yamlls" "zk" "zls"
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
        servers = builtins.listToAttrs (map (srv: {
 		name = srv;
    		value = { enable = true; };
  	}) allServers);   
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

