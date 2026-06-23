{
  flake.modules.nixos.root =
    { pkgs, ... }:
    {
      users.users.root = {
        shell = pkgs.zsh;
        initialPassword = "id";
      };
    };
}
