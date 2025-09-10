{
  flake.modules.homeManager.accounts =
    { pkgs, ... }:
    let
      address = "abdurrahman@hussain.house";
      userName = "ruslan.hussain@icloud.com";
      passwordCommand = "secret-tool lookup email ${address}";
    in
    {
      accounts.email.accounts.Apple = {
        primary = true;
        realName = "Abdurrahman Hussain";
        inherit address userName passwordCommand;
        imap = {
          host = "imap.mail.me.com";
          port = 993;
          tls.enable = true;
        };
        smtp = {
          host = "smtp.mail.me.com";
          port = 587;
          tls.useStartTls = true;
        };
      };

      home.packages = with pkgs; [ libsecret ];
    };
}
