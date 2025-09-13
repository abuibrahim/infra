{
  flake.modules.homeManager.email = {
    programs.mu.enable = true;

    accounts.email.accounts.Apple.mu.enable = true;
    accounts.email.accounts.Gmail.mu.enable = true;
  };
}
