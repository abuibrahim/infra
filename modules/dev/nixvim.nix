{ inputs, ... }:
{
  flake.modules.homeManager.dev = {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
      imports = [ inputs.nixvim-config.nixvimModule ];

      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}
