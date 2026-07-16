{
  flake.modules.nixos.base =
    { pkgs, hostName, ... }:
    {
      networking = {
        inherit hostName;
        networkmanager = {
          enable = true;
          plugins = with pkgs; [
            networkmanager-openconnect
          ];
        };
      };
      environment.systemPackages = with pkgs; [
        gpclient
        gpauth
        gp-saml-gui
        openconnect
      ];
    };
}
