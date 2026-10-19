{
  config,
  ...
}:
{
  flake.modules.darwin."host/shusha".imports =
    with config.flake.modules.darwin;
    [
      abdurrahman
      shell
    ]
    ++ [
      {
        home-manager.users.abdurrahman.imports = with config.flake.modules.homeManager; [
          base
          dev
          email
          fonts
          shell
        ];
      }
    ];
}
