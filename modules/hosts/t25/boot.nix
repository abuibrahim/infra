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
          availableKernelModules = [
            "xhci_pci"
            "nvme"
            "usbhid"
            "usb_storage"
            "uas"
            "sd_mod"
          ];
        };

        plymouth.enable = true;
        kernelParams = [ "quiet" ];
        kernelModules = [ "kvm-intel" ];
      };

      environment.systemPackages = [ pkgs.sbctl ];
    };
}
