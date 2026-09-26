{ inputs, ... }:
{
  flake.modules = {
    nixos.desktop =
      { pkgs, ... }:
      {
        programs.dms-shell = {
          enable = true;
        };
        services.displayManager.dms-greeter = {
          enable = true;
          compositor.name = "niri";
        };
        services.upower.enable = true;
        services.geoclue2.enable = true;
        environment.systemPackages = with pkgs; [
          libnotify
        ];
      };

    homeManager.desktop = {
      imports = [
        inputs.dms.homeModules.dank-material-shell
      ];
      programs.dank-material-shell = {
        enable = true;
      };
    };
  };
}
