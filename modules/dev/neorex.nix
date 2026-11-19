{ inputs, ... }:
{
  flake.modules.homeManager.dev =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      neorex = inputs.neorex.packages.${pkgs.stdenv.hostPlatform.system}.default;
      neovim = config.programs.nixvim.build.package;
      nvim = pkgs.writeShellScriptBin "nvim" ''
        if [ -n "$REX_SESSION" ] && [ -t 0 ]; then
          PATH=${neovim}/bin:$PATH exec ${neorex}/bin/neorex "$@"
        fi
        exec ${neovim}/bin/nvim "$@"
      '';
    in
    {
      home.packages = [
        neorex
        (lib.hiPrio nvim)
      ];

      xdg.configFile."rex/init.lua".text = ''
        pcall(dofile, os.getenv("HOME") .. "/.local/state/neorex/rex.lua")
      '';
    };
}
