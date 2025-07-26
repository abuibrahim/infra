{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome = {
        enable = true;
        extraGSettingsOverrides = ''
          [org.gnome.mutter]
          experimental-features=['scale-monitor-framebuffer', 'xwayland-native-scaling']
        '';
      };

      services.gnome.core-apps.enable = false;

      environment.gnome.excludePackages = with pkgs; [
        gnome-tour
      ];

      environment.systemPackages = with pkgs; [
        loupe
        nautilus
        gnome-calendar
        file-roller
        seahorse
      ];
    };
}
