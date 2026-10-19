{
  # One notmuch database shared by all accounts under the maildir root.
  flake.modules.homeManager.email = {
    programs.notmuch = {
      enable = true;
      settings = {
        # lieer applies Gmail labels itself; mbsync accounts derive tags from
        # folders in their postNew hooks.
        new.tags = [ ];
        search.exclude_tags = [
          "trash"
          "spam"
        ];
      };
    };
  };
}
