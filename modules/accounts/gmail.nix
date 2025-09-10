{
  flake.modules.homeManager.accounts =
    { pkgs, ... }:
    let
      address = "ruslan@babayev.com";
      userName = "${address}";
      passwordCommand = "secret-tool lookup email ${address}";
    in
    {
      accounts.email.accounts.Gmail = {
        realName = "Ruslan Babayev";
        inherit address userName passwordCommand;
        folders = {
          inbox = "INBOX";
          drafts = "[Gmail]/Drafts";
          sent = "[Gmail]/Sent Mail";
          trash = "[Gmail]/Trash";
        };
        imap = {
          host = "imap.gmail.com";
          port = 993;
          tls.enable = true;
        };
        smtp = {
          host = "smtp.gmail.com";
          port = 587;
          tls.useStartTls = true;
        };
      };

      home.packages = with pkgs; [ libsecret ];
    };
}
