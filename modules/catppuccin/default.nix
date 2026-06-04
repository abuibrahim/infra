{ inputs, ... }:
let
  catppuccin = {
    autoEnable = true;
    enable = true;
    flavor = "mocha";
    accent = "lavender";
  };
in
{
  flake.modules = {
    nixos.base = {
      imports = [ inputs.catppuccin.nixosModules.catppuccin ];
      inherit catppuccin;
    };

    homeManager.base = {
      imports = [ inputs.catppuccin.homeModules.catppuccin ];
      inherit catppuccin;
    };
  };
}
