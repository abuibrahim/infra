{
  flake.modules.nixos.desktop = {
    programs.dconf.enable = true;
  };

  flake.modules.homeManager.desktop = {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        monospace-font-name = "JetBrainsMono NF 12";
      };
      "org/gnome/desktop/default-applications/terminal" = {
        exec = "ghostty";
        exec-arg = "-e";
      };
      "org/gnome/desktop/wm/preferences" = {
        focus-mode = "sloppy";
        auto-raise = true;
      };
    };
  };
}
