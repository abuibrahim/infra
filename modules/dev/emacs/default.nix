{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      programs.emacs = {
        enable = false;
        package = pkgs.emacs-pgtk;
        extraConfig = builtins.readFile ./init.el;
        extraPackages =
          epkgs: with epkgs; [
            magit
            smartparens
            editorconfig
            nix-mode
            markdown-mode
            cmake-mode
            auto-dark
            catppuccin-theme
            ligature
            rust-mode
            haskell-mode
            lua-mode
            treesit-grammars.with-all-grammars
            mu4e
            mu4easy
          ];
      };

      services = {
        emacs = {
          enable = false;
          client.enable = true;
        };
      };
    };
}
