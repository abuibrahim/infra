{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        mosh
        ripgrep
        fd
        procs
        nixd
        nixfmt-rfc-style
        google-chrome
        wl-clipboard-rs
      ];
    };
}
