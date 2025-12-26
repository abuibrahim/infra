{
  flake.modules.nixos.base =
    { hostName, ... }:
    {
      networking = {
        inherit hostName;
      };
    };
}
