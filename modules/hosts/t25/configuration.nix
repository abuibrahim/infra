{
  flake.modules.nixos."host/t25" = {
    services.openssh.enable = true;
    services.printing.enable = true;
    nixpkgs.config.allowUnfree = true;
  };
}
