{ config, ... }:
{
  flake = {
    meta.users = {
      abdurrahman = {
        email = "2321000+abuibrahim@users.noreply.github.com";
        name = "Abdurrahman Hussain";
        username = "abdurrahman";
      };
    };

    modules.nixos.abdurrahman =
      { pkgs, ... }:
      {
        programs.zsh.enable = true;

        users.users.abdurrahman = {
          description = config.flake.meta.users.abdurrahman.name;
          isNormalUser = true;
          createHome = true;
          extraGroups = [
            "audio"
            "input"
            "networkmanager"
            "sound"
            "tty"
            "wheel"
          ];
          shell = pkgs.zsh;
          hashedPassword = "$6$I/aTj7WOOdgcpRZP$PHzM8GGM7IC6p2657sO0iOuKJkvnpBxZaBis4mh6j23QkITZAN7UrGRz20yg7E2mqAv1W50p3zDHqIbM4qHu80";
        };

      };

    modules.darwin.abdurrahman =
      { pkgs, ... }:
      {
        programs.zsh.enable = true;

        users.knownUsers = [
          "abdurrahman"
        ];
        users.users.abdurrahman = {
          uid = 501;
          name = "abdurrahman";
          home = "/Users/abdurrahman";
          shell = pkgs.zsh;
        };
      };
  };
}
