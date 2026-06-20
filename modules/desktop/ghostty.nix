{
  flake.modules.homeManager.desktop = {
    programs.ghostty = {
      enable = true;
      settings = {
        copy-on-select = true;
        background-opacity = 0.85;
        background-blur = true;
        link-url = true;
      };
    };
  };
}
