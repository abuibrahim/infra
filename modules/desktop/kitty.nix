{
  flake.modules.homeManager.desktop = {
    programs.kitty = {
      enable = true;
      settings = {
        background_opacity = 0.85;
        background_blur = 1;
      };
    };
  };
}
