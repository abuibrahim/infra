{
  flake.modules.homeManager.desktop = {
    services.mako = {
      enable = true;
      settings = {
        font = "JetBrainsMono NF 12";
      };
    };
  };
}
