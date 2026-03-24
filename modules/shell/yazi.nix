{
  flake.modules.homeManager.shell = {
    programs.yazi = {
      enable = true;
      shellWrapperName = "y";
    };
  };
}
