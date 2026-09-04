{
  flake.modules.homeManager.dev = { config, lib, ... }: {
    programs.lazygit = {
      enable = true;
      settings = {
        git = {
          skipDiscardChangeWarning = true;
          pagers = [
            {
              colorArg = "always";
              pager = "${lib.getExe config.programs.delta.package} --dark --paging=never";
            }
          ];
        };
      };
    };
  };
}
