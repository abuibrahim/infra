{
  flake.modules.homeManager.desktop = {
    programs.ghostty = {
      enable = true;
      settings = {
        font-family = "JetBrainsMono NF";
        font-size = 12;
        background-opacity = 0.9;
        background-blur-radius = 20;
        background-blur = true;
        link-url = true;
      };
    };
  };
}
