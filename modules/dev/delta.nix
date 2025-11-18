{
  flake.modules.homeManager.dev = {
    programs.delta = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
