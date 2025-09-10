{
  flake.modules.homeManager.shell = {
    programs.mu.enable = true;

    accounts.email.accounts.Apple.mu.enable = true;
    accounts.email.accounts.Gmail.mu.enable = true;
  };
}
