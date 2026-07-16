{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      home.pointerCursor = {
        enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 48;
        gtk.enable = true;
      };
    };
}
