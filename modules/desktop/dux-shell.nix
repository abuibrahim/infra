topLevel: {
  flake.modules.nixos.desktop =
    { config, ... }:
    {
      programs.dux-shell.enable = true;
      services = {
        displayManager = {
          dux-greeter = {
            enable = true;
            compositor.name = "niri";
            configHome = config.users.users.${topLevel.config.flake.meta.users.abdurrahman.username}.home;
          };
        };
        power-profiles-daemon.enable = true;
      };
    };
}
