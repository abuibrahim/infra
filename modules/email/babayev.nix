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
              # All accounts share one notmuch database; keep queries to
              # this account's mail.
              query-map = pkgs.writeText "query-map" ''
                Inbox=path:Babayev/** and tag:inbox and not tag:trash and not tag:spam
                Archive=path:Babayev/** and not tag:inbox and not tag:trash and not tag:spam
                Unread=path:Babayev/** and tag:unread and not tag:trash and not tag:spam
                Drafts=path:Babayev/** and tag:draft and not tag:trash and not tag:spam
                Sent=path:Babayev/** and tag:sent and not tag:trash and not tag:spam
                Flagged=path:Babayev/** and tag:flagged and not tag:trash and not tag:spam
                Trash=path:Babayev/** and tag:trash
                Spam=path:Babayev/** and tag:spam
              '';
            in
            {
              check-mail = "5m";
              check-mail-cmd = "gmi sync -C ${gmiPath} && notmuch new";
              copy-to = "";
              outgoing = "gmi send -C ${gmiPath} -t";
              query-map = "${query-map}";
              source = "notmuch://";
              # Gmail is label-based: lieer syncs tags, so don't expose (or
              # move files between) the maildir folders under the mail root.
              enable-maildir = false;
            };
        };
      };

      programs.lieer.enable = true;
    };
}
