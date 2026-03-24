{ inputs, ... }:
{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        inputs.globalprotect-openconnect.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
