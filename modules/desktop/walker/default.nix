{
  flake.modules.homeManager.desktop = {
    services.walker = {
      enable = true;
      systemd.enable = true;
      settings = {
        theme = "default";
      };
    };
  };
}
