{ inputs, ... }:
{
  flake.modules.homeManager.dev = {
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
      imports = [ inputs.nixvim-config.nixvimModule ];

      nixpkgs.source = inputs.nixpkgs;

      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}
