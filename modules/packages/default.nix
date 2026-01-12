{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        mosh
        procs
        nixd
        nixfmt
      ];
    };
}
