{
  flake.modules.nixos."host/t25" =
    { pkgs, ... }:
    {
      boot = {
        loader = {
          efi.canTouchEfiVariables = true;
          limine = {
            enable = true;
            secureBoot.enable = true;
          };
        };

        initrd = {
          systemd.enable = true;
          # The rest come from nixos-facter
          availableKernelModules = [ "uas" ];
        };

        kernelPackages = pkgs.linuxPackages_latest;
        plymouth.enable = true;
        kernelParams = [ "quiet" ];
      };

      environment.systemPackages = [ pkgs.sbctl ];
    };
}
