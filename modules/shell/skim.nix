{
  flake.modules.homeManager.shell = {
    programs.skim = {
      enable = true;
      enableFishIntegration = true;
      defaultCommand = "fd --type f";
      fileWidgetCommand = "fd --type f";
      fileWidgetOptions = [
        "--preview 'bat --number --color=always {}'"
      ];
      changeDirWidgetCommand = "fd --type d";
    };
  };
}
