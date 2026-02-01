{
  flake.modules.homeManager.email =
    { pkgs, ... }:
    {
      programs.aerc = {
        enable = true;
        extraConfig = {
          general = {
            unsafe-accounts-conf = true;
          };
          ui = {
            mouse-enabled = true;
          };
          compose = {
            address-book-cmd = "notmuch address \"%s\"";
          };
          filters = {
            "text/plain" = "colorize";
            "text/html" = "${pkgs.w3m}/bin/w3m -T text/html";
            ".headers" = "colorize";
          };
          "ui:folder=Sent" = {
            column-name = "{{index (.To | names) 0}}";
            index-columns = "flags:4,name<20%,subject,date>=";
          };
        };
        extraBinds = import ./_binds.nix;
      };
    };
}
