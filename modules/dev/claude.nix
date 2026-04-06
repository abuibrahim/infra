{
  flake.modules.homeManager.dev = {
    programs.claude-code.enable = false;
    nixpkgs.config.allowUnfree = true;
  };
}
