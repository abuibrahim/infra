{
  flake.modules = {
    nixos.base = {
      networking = {
        wireless.iwd = {
          enable = true;
          settings = {
            IPv6.Enabled = true;
            Settings.AutoConnect = true;
          };
        };
        networkmanager.wifi.backend = "iwd";
      };
    };
  };
}
