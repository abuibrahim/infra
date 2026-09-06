{
  flake.modules.homeManager.desktop = {
    programs.ghostty = {
      enable = true;
      settings = {
        copy-on-select = "clipboard";
        clipboard-read = "allow";
        background-opacity = 0.85;
        background-blur = true;
        link-url = true;
        shell-integration-features = "ssh-terminfo,ssh-env";
        adjust-box-thickness = 2;
      };
    };
  };
}
