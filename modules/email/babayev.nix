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
                Inbox=tag:inbox and not tag:trash and not tag:spam
                Archive=not tag:inbox and not tag:trash and not tag:spam
                Unread=tag:unread and not tag:trash and not tag:spam
                Drafts=tag:draft and not tag:trash and not tag:spam
                Sent=tag:sent and not tag:trash and not tag:spam
                Flagged=tag:flagged and not tag:trash and not tag:spam
                Trash=tag:trash
                Spam=tag:spam
              '';
            in
            {
              check-mail = "5m";
              check-mail-cmd = "gmi sync -C ${gmiPath} && notmuch new";
              copy-to = "";
              outgoing = "gmi send C ${gmiPath} -t";
              query-map = "${query-map}";
              source = "notmuch://${maildirBasePath}";
              folders-exclude = "mail";
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
