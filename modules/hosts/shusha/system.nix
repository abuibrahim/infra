{ self, config, ... }:
{
  flake.modules.darwin."host/shusha" = {
    # Let Determinate Systems manage nix
    nix.enable = false;

    nixpkgs.hostPlatform = "aarch64-darwin";

    # Enable sudo login with Touch ID
    security.pam.services.sudo_local.touchIdAuth = true;

    # Required by LLDB
    environment.variables = {
      LLDB_DEBUGSERVER_PATH = "/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/Resources/debugserver";
    };

    system = {
      primaryUser = config.flake.meta.users.abdurrahman.username;

      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
      };

      defaults = {
        dock = {
          autohide = true;
          show-recents = false;
          showhidden = true;
          static-only = false;
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
