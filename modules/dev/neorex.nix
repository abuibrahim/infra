{ inputs, ... }:
{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      home.packages = [ inputs.neorex.packages.${pkgs.stdenv.hostPlatform.system}.default ];
      home.shellAliases.nvim = "neorex";
    };
}
