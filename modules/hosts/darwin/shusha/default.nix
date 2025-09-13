{
  config,
  ...
}:
{
  flake.modules.darwin."darwin/shusha".imports =
    with config.flake.modules.darwin;
    [
      abdurrahman
    ]
    ++ [
      {
        home-manager.users.abdurrahman.imports = with config.flake.modules.homeManager; [
          accounts
          base
          dev
          fonts
          shell
        ];
      }
    ];
}
