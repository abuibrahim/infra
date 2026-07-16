{
  flake.modules.nixos."host/t25" =
    { config, ... }:
    {
      hardware.facter = {
        enable = true;
        reportPath = ./facter.json;
        detected.dhcp.enable = false;
      };

      hardware.graphics.enable = true;
      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
        prime = {
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:2:0:0";
        };
      };

      services.xserver.videoDrivers = [ "nvidia" ];
    };
}
