{
  flake.modules.nixos.desktop =
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
}
