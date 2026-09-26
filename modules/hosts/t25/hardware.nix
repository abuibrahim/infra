{
  flake.modules.nixos."host/t25" = {
    hardware.facter = {
      enable = true;
      reportPath = ./facter.json;
      detected.dhcp.enable = false;
    };

    hardware.graphics.enable = true;
  };
}
