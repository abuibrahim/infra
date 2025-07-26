{
  flake.modules.darwin."hosts/agdam" = {
    # Let Determinate Systems manage nix
    nix.enable = false;

    # Enable sudo login with Touch ID
    security.pam.services.sudo_local.touchIdAuth = true;
  };
}
