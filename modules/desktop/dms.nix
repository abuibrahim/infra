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
      environment.systemPackages = with pkgs; [
        libnotify
      ];
    };
}
