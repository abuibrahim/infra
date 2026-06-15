{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      programs.dms-shell = {
        enable = true;
        plugins = {
          Calculator = {
            enable = true;
            src = pkgs.fetchFromGitHub {
              owner = "rochacbruno";
              repo = "DankCalculator";
              rev = "0.2.2";
              sha256 = "sha256-bhV22bL38CJp58Y8tCY8sEBRYxmuk671fEymmdg0Yuk=";
            };
          };
          PrayerTimes = {
            enable = true;
            src = pkgs.fetchFromGitHub {
              owner = "muadzmo";
              repo = "prayertimes";
              rev = "82b16b235d3f06101d79f04529a1a32b4d32fe2c";
              sha256 = "sha256-BfA1uN/xqw7uhmE+/caTfbP23rzsA2kq2yx9P26Cgkg=";
            };
          };
        };
      };
      services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "niri";
      };
      environment.systemPackages = with pkgs; [
        libnotify
      ];
    };
}
