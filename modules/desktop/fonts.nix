{
  flake.modules.homeManager.fonts =
    { pkgs, ... }:
    {
      fonts.fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [ "JetBrainsMono NF" ];
        };
      };
      home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];
    };
}
