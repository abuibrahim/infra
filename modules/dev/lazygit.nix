{
  flake.modules.homeManager.dev = {
    programs.lazygit = {
      enable = true;
      settings = {
        promptToReturnFromSubprocess = false;
        git = {
          skipDiscardChangeWarning = true;
        };
      };
    };
  };
}
