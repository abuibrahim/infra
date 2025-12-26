{
  inputs,
  lib,
  config,
  ...
}:
let
  prefix = "host/";
  collectHostModules = modules: lib.filterAttrs (name: _: lib.hasPrefix prefix name) modules;
in
{
  flake.darwinConfigurations = lib.pipe (collectHostModules config.flake.modules.darwin) [
    (lib.mapAttrs' (
      name: module:
      let
        specialArgs = {
          inherit inputs;
          hostName = lib.removePrefix prefix name;
        };
      in
      {
        name = lib.removePrefix prefix name;
        value = inputs.nix-darwin.lib.darwinSystem {
          inherit specialArgs;
          modules = [
            module
            inputs.home-manager.darwinModules.home-manager
            {
              home-manager.extraSpecialArgs = specialArgs;
            }
          ];
        };
      }
    ))
  ];
}
