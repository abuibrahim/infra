{
  flake.modules.homeManager.dev =
    {
      pkgs,
      lib,
      ...
    }:
    {
      programs.helix = {
        enable = true;
        extraPackages = with pkgs; [
          marksman
        ];
        languages.language = [
          {
            name = "nix";
            auto-format = true;
            formatter.command = "${lib.getExe pkgs.nixfmt}";
          }
          {
            name = "c";
            auto-format = true;
            formatter.command = "${pkgs.clang-tools}/bin/clang-format";
          }
          {
            name = "cpp";
            auto-format = true;
            formatter.command = "${pkgs.clang-tools}/bin/clang-format";
          }
          {
            name = "rust";
            auto-format = true;
            formatter.command = "${lib.getExe pkgs.rustfmt}";
          }
          {
            name = "haskell";
            auto-format = true;
            formatter = {
              command = "${lib.getExe pkgs.ormolu}";
              args = [
                "--stdin-input-file"
                "%{buffer_name}"
              ];
            };
          }
          {
            name = "cabal";
            auto-format = true;
            formatter.command = "${lib.getExe pkgs.haskellPackages.cabal-gild}";
          }
        ];
        settings = {
          # Built-in, ANSI-only theme: follows the terminal's palette and background
          theme = "base16_default";
          editor = {
            lsp.display-inlay-hints = true;
            color-modes = true;
            bufferline = "multiple";
            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "underline";
            };
          };
        };
      };
    };
}
