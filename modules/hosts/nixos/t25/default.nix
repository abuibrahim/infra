{
  config,
  ...
}:
{
  flake.modules.nixos."nixos/t25".imports =
    with config.flake.modules.nixos;
    [
      # Modules
      base
      bluetooth
      desktop
      facter
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
          accounts
          desktop
          fonts
          dev
          facter
          shell
        ];
      }
    ];
}
