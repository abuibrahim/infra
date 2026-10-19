{
  flake.modules.homeManager.shell =
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
