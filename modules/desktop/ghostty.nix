{
  flake.modules.homeManager.desktop = {
    programs.ghostty = {
      enable = true;
      settings = {
        background-opacity = 0.85;
        background-blur-radius = 20;
        background-blur = true;
        link-url = true;
      };
    };
  };
}
