{
  flake.modules.homeManager.shell = {
    programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
      };
    };
  };
}
