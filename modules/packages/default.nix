{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        mosh
        fd
        procs
        nixd
        nixfmt-rfc-style
        google-chrome
        wl-clipboard-rs
      ];
    };
}
