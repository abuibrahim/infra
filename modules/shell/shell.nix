{
  flake.modules.homeManager.shell = {
    home.shell.enableShellIntegration = true;
    home.sessionPath = [ "$HOME/.local/bin" ];
  };
}
