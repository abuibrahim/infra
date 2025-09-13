{
  flake.modules.homeManager.desktop =
    { lib, ... }:
    {
      services.wpaperd = {
        enable = true;
        settings = {
          default = {
            path = "~/Pictures/Wallpapers";
            transition = {
              bounce = {
                bounces = 1.0;
              };
            };
          };
        };
      };
      systemd.user.services.wpaperd.Unit.ConditionEnvironment = lib.mkForce [
        "WAYLAND_DISPLAY"
        "!XDG_CURRENT_DESKTOP=GNOME"
      ];
    };
}
