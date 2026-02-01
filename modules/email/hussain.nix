{
  flake.modules.homeManager.email =
    { pkgs, config, ... }:
    {
      accounts.email.accounts.Hussain = rec {
        primary = true;
        address = "abdurrahman@hussain.house";
        userName = "ruslan.hussain@icloud.com";
        realName = "Abdurrahman Hussain";
        passwordCommand = "security find-generic-password -s mbsync-icloud -a ${address} -w";
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
        notmuch.enable = true;
        msmtp.enable = true;
        mbsync = {
          enable = true;
          create = "both";
          expunge = "both";
          groups.main.channels = {
            all = {
              patterns = [
                "INBOX"
                "Archive"
                "Trash"
                "Spam"
                "Drafts"
              ];
              extraConfig = {
                CopyArrivalDate = "yes";
                Create = "both";
                Expunge = "both";
                SyncState = "*";
              };
            };
            sent = {
              farPattern = "Sent Messages";
              nearPattern = "Sent";
              extraConfig = {
                CopyArrivalDate = "yes";
                Create = "both";
                Expunge = "both";
                SyncState = "*";
              };
            };
          };
        };
        aerc = {
          enable = true;
          extraAccounts =
            let
              maildirBasePath = "${config.accounts.email.maildirBasePath}";
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
              check-mail-cmd = "mbsync -a && notmuch new";
              maildir-store = "${maildirBasePath}";
              maildir-account-path = "Hussain";
              query-map = "${query-map}";
              source = "notmuch://${maildirBasePath}";
              sent = "Sent";
            };
        };
      };

      programs = {
        notmuch.enable = true;
        mbsync.enable = true;
      };
    };
}
