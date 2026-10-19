{
  flake.modules.homeManager.email =
    { pkgs, ... }:
    {
      accounts.email.accounts.Hussain = rec {
        primary = true;
        address = "abdurrahman@hussain.house";
        userName = "ruslan.hussain@icloud.com";
        realName = "Abdurrahman Hussain";
        passwordCommand =
          if pkgs.stdenv.hostPlatform.isDarwin then
            "security find-generic-password -s mbsync-icloud -a ${address} -w"
          else
            "${pkgs.libsecret}/bin/secret-tool lookup email ${address}";
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
                "Junk"
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
            # iCloud's trash. (The server's "Trash" is a stray custom folder.)
            deleted = {
              farPattern = "Deleted Messages";
              nearPattern = "Deleted";
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
              # Inbox, Archive, Sent, Drafts, Deleted and Junk come from the
              # maildir folders (enable-maildir), so moves show up immediately.
              query-map = pkgs.writeText "query-map" ''
                Unread=path:Hussain/** and tag:unread and not tag:trash and not tag:spam
                Starred=path:Hussain/** and tag:flagged and not tag:trash and not tag:spam
              '';
            in
            {
              check-mail = "5m";
              check-mail-cmd = "mbsync -a && notmuch new";
              maildir-account-path = "Hussain";
              folders-sort = "Inbox,Unread,Starred,Drafts,Sent,Archive,Junk,Deleted";
              # e.g. mail to self lives in both Inbox and Sent
              multi-file-strategy = "act-dir";
              query-map = "${query-map}";
              source = "notmuch://";
              sent = "Sent";
            };
        };
      };

      programs = {
        notmuch = {
          enable = true;
          # mbsync has no labels: keep tags in sync with the IMAP folder each
          # message lives in, so notmuch searches agree with the server
          # (unread/flagged/draft already come from maildir flags).
          hooks.postNew = ''
            notmuch tag --batch <<'EOF'
            +inbox -- folder:Hussain/Inbox and not tag:inbox
            -inbox -- path:Hussain/** and tag:inbox and not folder:Hussain/Inbox
            +sent -- folder:Hussain/Sent and not tag:sent
            +trash -- folder:Hussain/Deleted and not tag:trash
            -trash -- path:Hussain/** and tag:trash and not folder:Hussain/Deleted
            +spam -- folder:Hussain/Junk and not tag:spam
            -spam -- path:Hussain/** and tag:spam and not folder:Hussain/Junk
            EOF
          '';
        };
        mbsync.enable = true;
      };
    };
}
