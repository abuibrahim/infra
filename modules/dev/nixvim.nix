{ inputs, ... }:
{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      programs.nixvim = {
        imports = [ inputs.neve.nixvimModule ];

        enable = true;
        defaultEditor = true;
        vimAlias = true;
        jdtls.enable = false;
        nvim-lint.enable = false;
        wakatime.enable = false;
        keymaps = [
          {
            key = "<leader>n";
            action = "<cmd>Neotree toggle<CR>";
            options.desc = "Toggle filetree";
          }
          {
            key = "<leader>cc";
            action = "<cmd>CMakeBuild<CR>";
            options.desc = "CMake Build";
          }
          {
            key = "<leader>cg";
            action = "<cmd>CMakeGenerate<CR>";
            options.desc = "CMake Generate";
          }
          {
            key = "<leader>cp";
            action = "<cmd>CMakeSelectBuildPreset<CR>";
            options.desc = "CMake Select Build Preset";
          }
          {
            key = "<leader>ct";
            action = "<cmd>CMakeRunTest<CR>";
            options.desc = "CMake Run Test";
          }
        ];
        opts = {
          list = pkgs.lib.mkForce false;
          colorcolumn = pkgs.lib.mkForce "";
          guicursor = pkgs.lib.mkForce [
            "n-v-c:block" # Normal, Visual and Command mode
            "i-ci-ve:ver25" # Insert, Command-line Insert and Visual-exclude mode
            "r-cr:hor20" # Replace and Command-line Replace mode
            "o:hor50" # Operator-pending mode
            "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" # All modes: blinking settings
            "sm:block-blinkwait175-blinkoff150-blinkon175" # Showmatch mode
          ];
        };
        plugins = {
          cmake-tools = {
            enable = true;
            settings = {
              cmake_build_directory = "build/\${variant:buildType}";
              cmake_soft_link_compile_commands = false;
              cmake_compile_commands_from_lsp = true;
              cmake_dap_configuration = {
                name = "cpp";
                type = "lldb";
                request = "launch";
                stopOnEntry = false;
                runInTerminal = true;
                console = "integratedTerminal";
              };
            };
          };
          dap-lldb = {
            enable = true;
            settings = {
              codelldb_path = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
            };
          };
          neotest = {
            enable = true;
            adapters = {
              ctest.enable = true;
            };
          };
        };
      };
    };
}
