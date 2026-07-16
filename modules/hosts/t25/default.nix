{
  config,
  ...
}:
{
  flake.modules.nixos."host/t25".imports =
    with config.flake.modules.nixos;
    [
      # Modules
      base
      bluetooth
      desktop
      fwupd
      shell

      # Users
      root
      abdurrahman
    ]
    ++ [
      {
        home-manager.users.abdurrahman.imports = with config.flake.modules.homeManager; [
          base
          desktop
          dev
          email
          fonts
          shell
        ];
      }
    ];
}
