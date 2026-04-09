{
  flake.modules.homeManager.dev = {
    programs.claude-code.enable = true;
    nixpkgs.config.allowUnfree = true;
  };
}
