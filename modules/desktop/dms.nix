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
