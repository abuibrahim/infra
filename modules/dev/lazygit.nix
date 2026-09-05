{
  flake.modules.homeManager.dev = { config, lib, ... }: {
    programs.lazygit = {
      enable = true;
      settings = {
        git = {
          skipDiscardChangeWarning = true;
          diffRenderers = [
            {
              colorArg = "always";
              command = "${lib.getExe config.programs.delta.package} --dark --paging=never";
            }
          ];
        };
      };
    };
  };
}
