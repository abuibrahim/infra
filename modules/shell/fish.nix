{
  flake.modules = {
    nixos.shell = {
      programs.fish = {
        enable = true;
      };
    };

    homeManager.shell = {
      programs.fish = {
        enable = true;
        functions = {
          fish_greeting = "";
        };
      };
    };

    darwin.shell =
      { pkgs, ... }:
      {
        environment.shells = [ pkgs.fish ];
      };
  };
}
