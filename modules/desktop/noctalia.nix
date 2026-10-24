{
  flake.modules.nixos.desktop = {
    programs.noctalia = {
      enable = true;
      recommendedServices.enable = true;
      systemd.enable = true;
    };
    services.displayManager.noctalia-greeter.enable = true;
    services.geoclue2.enable = true;
  };
}
