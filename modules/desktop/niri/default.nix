{
  flake.modules = {
    nixos.desktop =
      { pkgs, ... }:
      {
        programs.niri.enable = true;
        environment.sessionVariables.NIXOS_OZONE_WL = "1";
        environment.systemPackages = with pkgs; [
          xwayland-satellite
        ];
      };

    homeManager.desktop = {
      xdg.configFile."niri/config.kdl".source = ./config.kdl;
    };
  };
}
