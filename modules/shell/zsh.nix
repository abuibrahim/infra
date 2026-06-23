{
  flake.modules = {
    nixos.shell = {
      programs.zsh = {
        enable = true;
      };
    };

    homeManager.shell = {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        defaultKeymap = "emacs";
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
      };
    };

    darwin.shell =
      { pkgs, ... }:
      {
        environment.shells = [ pkgs.zsh ];
      };
  };
}
