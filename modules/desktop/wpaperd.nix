{
  flake.modules.homeManager.desktop =
    { lib, ... }:
    {
      services.wpaperd = {
        enable = true;
        settings = {
          any = {
            path = "~/Pictures/Wallpapers";
          };
        };
      };
      systemd.user.services.wpaperd.Unit.ConditionEnvironment = lib.mkForce [
        "WAYLAND_DISPLAY"
        "!XDG_CURRENT_DESKTOP=GNOME"
      ];
    };
}
