{
  flake.modules = {
    nixos.desktop = {
      programs.niri.enable = true;
    };

    homeManager.desktop = { config, ... }: {
      wayland.windowManager.niri =
        let
          dmsDir = "${config.home.homeDirectory}/.config/niri/dms";
        in
        {
          enable = true;
          package = null;
          systemd.enable = false;
          xwaylandSatellitePackage = null;
          portalPackage = null;
          settings = {
            prefer-no-csd = { };
            hotkey-overlay.skip-at-startup = { };
            _children = [
              { include._args = [ "${dmsDir}/alttab.kdl" ]; }
              { include._args = [ "${dmsDir}/binds.kdl" ]; }
              { include._args = [ "${dmsDir}/colors.kdl" ]; }
              { include._args = [ "${dmsDir}/cursor.kdl" ]; }
              { include._args = [ "${dmsDir}/input.kdl" ]; }
              { include._args = [ "${dmsDir}/layout.kdl" ]; }
              { include._args = [ "${dmsDir}/outputs.kdl" ]; }
              { include._args = [ "${dmsDir}/windowrules.kdl" ]; }
              { include._args = [ "${dmsDir}/wpblur.kdl" ]; }
            ];
            layout.focus-ring.off = { };
            layout.gaps = 8;
          };
        };
    };
  };
}
