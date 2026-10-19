{
  flake.modules.nixos.root =
    { pkgs, ... }:
    {
      users.users.root = {
        shell = pkgs.zsh;
        # Locked: use sudo from a wheel user. With mutableUsers this only
        # applies to new installs; on existing hosts run `passwd -l root`.
        hashedPassword = "!";
      };
    };
}
