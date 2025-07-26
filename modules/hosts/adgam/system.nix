{ self, config, ... }:
{
  flake.modules.darwin."hosts/agdam" = {
    system = {
      primaryUser = config.flake.meta.users.abdurrahman.username;

      keyboard = {
        enableKeyMapping = true;
        swapLeftCtrlAndFn = true;
      };

      defaults = {
        dock = {
          autohide = true;
          orientation = "left";
          show-recents = false;
          showhidden = true;
          static-only = false;
          persistent-apps = [
            "/Applications/Google Chrome.app"
            "/Applications/Ghostty.app"
            "/System/Applications/Mail.app"
            "/System/Applications/Calendar.app"
            "/System/Applications/System Settings.app"
          ];
        };

        finder = {
          ShowPathbar = true;
        };
      };

      # Set Git commit hash for darwin-version.
      configurationRevision = self.rev or self.dirtyRev or null;
      stateVersion = 6;
    };
  };
}
