{
  flake.modules.homeManager.desktop =
    { pkgs, lib, ... }:
    {
      services.swayidle = {
        enable = true;
        timeouts = [
          {
            timeout = 300; # 5 minutes
            command = "${pkgs.swaylock-effects}/bin/swaylock -f";
            resumeCommand = ""; # No action on resume
          }
        ];
        events = {
          before-sleep = "${pkgs.swaylock-effects}/bin/swaylock -f";
        };
      };

      systemd.user.services.swayidle.Unit.ConditionEnvironment = lib.mkForce [
        "WAYLAND_DISPLAY"
        "!XDG_CURRENT_DESKTOP=GNOME"
      ];
    };
}
