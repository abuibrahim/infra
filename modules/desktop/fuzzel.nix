{
  flake.modules.homeManager.desktop = {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "AdwaitaSans:size=16";
        };
      };
    };
  };
}
