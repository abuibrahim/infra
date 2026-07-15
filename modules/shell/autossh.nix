{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        autossh
      ];

      programs.zsh.shellAliases = {
        ash = "autossh -M 0 -q";
      };
    };
}
