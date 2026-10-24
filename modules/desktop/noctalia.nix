{
  flake.modules.nixos.desktop = {
    programs.noctalia = {
      enable = true;
      recommendedServices.enable = true;
      systemd.enable = true;
    };
    services = {
      displayManager.noctalia-greeter.enable = true;
      geoclue2.enable = true;
      pipewire = {
        enable = true;
        pulse.enable = true;
      };
    };
  };
}
