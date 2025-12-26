{
  flake.modules = {
    nixos.dev = {
      # needed for store VS Code auth token
      services.gnome-keyring.enable = true;
    };

    homeManager.dev =
      { pkgs, hostName, ... }:
      {
        nixpkgs.config.allowUnfree = true;

        programs.vscode = {
          enable = false;
          mutableExtensionsDir = false;
          profiles.default = {
            enableExtensionUpdateCheck = false;
            enableUpdateCheck = false;
            userSettings = {
              "extensions.autoUpdate" = false;
              "telemetry.telemetryLevel" = "off";
              "workbench.startupEditor" = "none";
              "workbench.preferredLightColorTheme" = "Catppuccin Latte";
              "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";
              "workbench.colorTheme" = "Catppuccin Mocha";
              "workbench.iconTheme" = "catppuccin-mocha";
              "window.autoDetectColorScheme" = false;
              "editor.fontFamily" = "JetBrainsMono NF";
              "editor.fontSize" = 15;
              "editor.fontLigatures" = true;
              "editor.inlayHints.enabled" = "offUnlessPressed";
              "haskell.manageHLS" = "PATH";
              "nix.enableLanguageServer" = true;
              "nix.serverPath" = "nixd";
              "nix.formatterPath" = "nixfmt";
              "nix.serverSettings.nixd.formatting.command" = [ "nixfmt" ];
              "nix.serverSettings.nixd.nixpkgs.expr" = "(builtins.getFlake (toString ./.)).inputs.nixpkgs";
              "nix.serverSettings.nixd.options.nixos.expr" =
                "(builtins.getFlake (toString ./.)).nixosConfigurations.${hostName}.options";
              "nix.serverSettings.nixd.options.home-manager.expr" =
                "(builtins.getFlake (toString ./.)).nixosConfigurations.${hostName}.options.home-manager.users.type.getSubOptions []";
            };

            extensions =
              with pkgs.vscode-extensions;
              [
                ms-vscode.cmake-tools
                ms-vscode-remote.remote-ssh
                ms-python.python
                llvm-vs-code-extensions.vscode-clangd
                vadimcn.vscode-lldb
                haskell.haskell
                justusadam.language-haskell
                rust-lang.rust-analyzer
                jnoortheen.nix-ide
                tamasfe.even-better-toml
                zxh404.vscode-proto3
                github.vscode-pull-request-github
                github.copilot
              ]
              ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                {
                  name = "vscode-augment";
                  publisher = "augment";
                  version = "0.555.1";
                  sha256 = "0611c8e7330d9192bfe3a20132f8d56cffb3a025cb96b8a4213cb9dfa7b21c28";
                }
              ];
          };
        };
      };
  };
}
