{
  flake.modules.homeManager.desktop =
    { pkgs, lib, ... }:
    {
      programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings = [
          {
            layer = "top";
            position = "top";
            spacing = 0;
            height = 32;

            modules-left = [
              "niri/workspaces"
            ];

            modules-center = [
              "clock"
            ];

            modules-right = [
              "group/tray-expander"
              "niri/language"
              "bluetooth"
              "network"
              "group/pulseaudio"
              "cpu"
              "battery"
            ];

            "cpu" = {
              interval = 5;
              format = "";
              on-click = "${lib.getExe pkgs.ghostty} -e ${lib.getExe pkgs.bottom}";
            };

            "clock" = {
              format = "{:%A %H:%M}";
              format-alt = "{:%d %B W%V %Y}";
              tooltip = true;
              tooltip-format = "{calendar}";
            };

            "network" = {
              format-icons = [
                "󰤯"
                "󰤟"
                "󰤢"
                "󰤥"
                "󰤨"
              ];
              format-ethernet = "󰈀";
              format-wifi = "{icon}";
              format-disconnected = "󰖪";
              tooltip = true;
              tooltip-format-wifi = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
              tooltip-format-ethernet = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
              tooltip-format-disconnected = "Disconnected";
              interval = 3;
              spacing = 1;
              on-click = "${lib.getExe pkgs.ghostty} -e ${pkgs.impala}/bin/impala";
            };

            "battery" = {
              format = "{capacity}% {icon}";
              format-discharing = "{icon}";
              format-charging = "󰂄";
              format-plugged = "";
              format-icons = {
                charging = [
                  "󰢜"
                  "󰂆"
                  "󰂇"
                  "󰂈"
                  "󰢝"
                  "󰂉"
                  "󰢞"
                  "󰂊"
                  "󰂋"
                  "󰂅"
                ];
                default = [
                  "󰁺"
                  "󰁻"
                  "󰁼"
                  "󰁽"
                  "󰁾"
                  "󰁿"
                  "󰂀"
                  "󰂁"
                  "󰂂"
                  "󰁹"
                ];
              };
              format-full = "󰂅";
              on-click = "";
              tooltip-format-discharging = "{power:>1.0f}W↓ {capacity}%";
              tooltip-format-charging = "{power:>1.0f}W↑ {capacity}%";
              interval = 5;
              states = {
                warning = 20;
                critical = 10;
              };
            };

            "bluetooth" = {
              format = "󰂯";
              format-disabled = "󰂲";
              format-connected = "󰂱";
              tooltip-format = "Devices connected: {num_connections}";
              on-click = "${lib.getExe pkgs.ghostty} -e ${lib.getExe pkgs.bluetui}";
            };

            "group/pulseaudio" = {
              orientation = "horizontal";
              modules = [
                "pulseaudio"
                "pulseaudio/slider"
              ];
              drawer = {
                transition-duration = 300;
                transition-left-to-right = true;
              };
            };

            "pulseaudio" = {
              format = "{icon}";
              format-muted = "󰝟";
              format-icons = {
                default = [
                  ""
                  ""
                  ""
                ];
              };
              tooltip-format = "Playing at {volume}%";
              scroll-step = 5;
              on-click = "${lib.getExe pkgs.ghostty} -e ${lib.getExe pkgs.wiremix}";
              on-click-right = "${lib.getExe pkgs.pamixer} -t";
            };

            "pulseaudio/slider" = {
              min = 0;
              max = 100;
            };

            "niri/language" = {
              format = "{variant}";
            };

            "niri/workspaces" = {
              format = "{icon}";
              format-icons = {
                active = "";
                default = "";
              };
            };

            "group/tray-expander" = {
              orientation = "inherit";
              drawer = {
                transition-duration = 600;
                children-class = "tray-group-item";
              };
              modules = [
                "custom/expand-icon"
                "tray"
              ];
            };

            "custom/expand-icon" = {
              format = " ";
              tooltip = false;
            };

            "tray" = {
              icon-size = 12;
              spacing = 12;
            };
          }
        ];

        style = builtins.readFile ./style.css;
      };

      catppuccin.waybar.mode = "createLink";

      systemd.user.services.waybar.Unit.ConditionEnvironment = lib.mkForce [
        "WAYLAND_DISPLAY"
        "!XDG_CURRENT_DESKTOP=GNOME"
      ];
    };
}
