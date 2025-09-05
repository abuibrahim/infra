{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        mosh
        procs
        nixd
        nixfmt-rfc-style
        google-chrome
        wl-clipboard-rs
      ];
    };
}
