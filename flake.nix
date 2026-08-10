{
  description = "neovim + dependencies";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        lib = pkgs.lib;

        tools = with pkgs; [
          # Runtime
          fd
          gcc
          git
          ripgrep
          tree-sitter

          # LSPs
          ansible-language-server
          awk-language-server
          bash-language-server
          docker-compose-language-service
          docker-language-server
          emmylua-ls
          fish-lsp
          gopls
          just-lsp
          nixd
          postgres-language-server
          ruff
          rust-analyzer
          systemd-lsp
          taplo
          tinymist
          ty
          vscode-langservers-extracted
          yaml-language-server
          zls

          # Formatters
          clang-tools
          dockerfmt
          fish
          gawk
          gotools
          just
          nixfmt
          prettier
          rustfmt
          shfmt
          sqruff
          stylua
          typst
          yamlfix
          zig
        ];

        nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
          luaRcContent = "";
          wrapRc = false;
          wrapperArgs = lib.escapeShellArgs [
            "--prefix"
            "PATH"
            ":"
            (lib.makeBinPath tools)
          ];
        };
      in
      {
        packages.default = nvim;
        packages.nvim = nvim;
        apps.default = flake-utils.lib.mkApp { drv = nvim; };
        formatter = pkgs.nixfmt-tree;
      }
    );
}
