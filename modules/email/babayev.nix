{
  flake.modules.homeManager.email =
    { pkgs, config, ... }:
    {
      accounts.email.accounts.Babayev = rec {
        flavor = "gmail.com";
        realName = "Ruslan Babayev";
        address = "ruslan@babayev.com";
        userName = "${address}";
        lieer.enable = true;
        notmuch.enable = true;
        aerc = {
          enable = true;
          extraAccounts =
            let
              maildirBasePath = "${config.accounts.email.maildirBasePath}";
              gmiPath = "${maildirBasePath}/Babayev";
              query-map = pkgs.writeText "query-map" ''
                Inbox=tag:inbox and not tag:archived
                Unread=tag:unread
                Drafts=tag:draft
                Sent=tag:sent
                Starred=tag:flagged
                Trash=tag:trash
                Spam=tag:spam
              '';
            in
            {
              check-mail = "5m";
              check-mail-cmd = "gmi sync -C ${gmiPath} && notmuch new";
              outgoing = "gmi send C ${gmiPath} -t";
              query-map = "${query-map}";
              source = "notmuch://${maildirBasePath}";
              sent = "Sent";
            };
        };
      };

      programs = {
        notmuch = {
          enable = true;
          new.tags = [ ];
          search.excludeTags = [
            "trash"
            "spam"
          ];
        };
        lieer.enable = true;
      };
    };
}
