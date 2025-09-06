{
  flake.modules.nixos.desktop = {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome = {
      enable = true;
      extraGSettingsOverrides = ''
        [org.gnome.mutter]
        experimental-features=['scale-monitor-framebuffer', 'xwayland-native-scaling']
      '';
    };
  };
}
