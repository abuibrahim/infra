{
  flake.modules.homeManager.dev =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      programs.helix =
        let
          theme = "catppuccin-${config.catppuccin.flavor}";
          themeTransparent = theme + "-transparent";
        in
        {
          enable = true;
          defaultEditor = true;
          extraPackages = with pkgs; [
            marksman
            wl-clipboard-rs
          ];
          languages.language = [
            {
              name = "nix";
              auto-format = true;
              formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
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
              formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
            }
            {
              name = "haskell";
              auto-format = true;
              formatter.command = "${pkgs.ormolu}/bin/ormolu";
            }
          ];
          themes = {
            ${themeTransparent} = {
              "inherits" = theme;
              "ui.background" = { };
            };
          };
          settings = {
            theme = lib.mkForce themeTransparent;
            editor.lsp.display-inlay-hints = true;
          };
        };

      catppuccin.helix.useItalics = true;
    };
}
