{
  flake.modules.homeManager.desktop = {
    services.walker = {
      enable = true;
      systemd.enable = true;
      settings = {
        theme = "default";
      };
    };
    systemd.user.services.walker.Unit.ConditionEnvironment = [
      "WAYLAND_DISPLAY"
      "!XDG_CURRENT_DESKTOP=GNOME"
    ];
  };
}
