{
  flake.modules.nixos."host/t25" = {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    services.printing.enable = true;
    nixpkgs.config.allowUnfree = true;
  };
}
