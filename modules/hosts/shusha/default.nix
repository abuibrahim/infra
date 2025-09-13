{
  config,
  ...
}:
{
  flake.modules.darwin."host/shusha".imports =
    with config.flake.modules.darwin;
    [
      abdurrahman
    ]
    ++ [
      {
        home-manager.users.abdurrahman.imports = with config.flake.modules.homeManager; [
          base
          dev
          fonts
          shell
        ];
      }
    ];
}
