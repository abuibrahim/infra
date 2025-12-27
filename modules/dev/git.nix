topLevel: {
  flake.modules.homeManager.dev =
    { config, pkgs, ... }:
    {
      programs.git = {
        enable = true;
        settings = {
          user.name = topLevel.config.flake.meta.users.${config.home.username}.name;
          user.email = topLevel.config.flake.meta.users.${config.home.username}.email;
          init.defaultBranch = "main";
          pull.ff = "only";
          push.default = "current";
          credential = builtins.listToAttrs (
            map (
              host: pkgs.lib.nameValuePair host { username = "abuibrahim"; }
            ) config.programs.gh.gitCredentialHelper.hosts
          );
        };
      };
    };
}
