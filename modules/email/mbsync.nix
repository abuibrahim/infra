let
  extraConfig = {
    CopyArrivalDate = "yes";
    Create = "both";
    Expunge = "both";
    SyncState = "*";
  };
in
{
  flake.modules.homeManager.email = {
    programs.mbsync.enable = true;

    accounts.email.accounts.Apple.mbsync = {
      enable = true;
      create = "both";
      expunge = "both";
      groups.Apple.channels = {
        all = {
          patterns = [
            "INBOX"
            "Archive"
            "Trash"
            "Spam"
            "Drafts"
          ];
          inherit extraConfig;
        };
        sent = {
          farPattern = "Sent Messages";
          nearPattern = "Sent";
          inherit extraConfig;
        };
      };
    };

    accounts.email.accounts.Gmail.mbsync = {
      enable = true;
      create = "both";
      expunge = "both";
      groups.Gmail.channels = {
        inbox = {
          farPattern = "INBOX";
          nearPattern = "Inbox";
          inherit extraConfig;
        };
        sent = {
          farPattern = "[Gmail]/Sent Mail";
          nearPattern = "Sent";
          inherit extraConfig;
        };
        drafts = {
          farPattern = "[Gmail]/Drafts";
          nearPattern = "Drafts";
          inherit extraConfig;
        };
        all = {
          farPattern = "[Gmail]/All Mail";
          nearPattern = "Archive";
          inherit extraConfig;
        };
        spam = {
          farPattern = "[Gmail]/Spam";
          nearPattern = "Spam";
          inherit extraConfig;
        };
        trash = {
          farPattern = "[Gmail]/Trash";
          nearPattern = "Trash";
          inherit extraConfig;
        };
      };
    };
  };
}
