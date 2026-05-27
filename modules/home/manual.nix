{
  # Disable the Home Manager manpage (`man home-configuration.nix`).
  #
  # Building it runs nixpkgs' `nixosOptionsDoc`, which writes an `options.json`
  # via `builtins.toFile` after `unsafeDiscardStringContext`. The `meta.maintainers`
  # / `meta.teams` options are declared by nixpkgs' `modules/generic/meta-maintainers.nix`,
  # a path Home Manager's declaration rewriter doesn't recognise, so the raw nixpkgs
  # store path leaks into the JSON and Nix warns about a derivation referencing a
  # store path without proper context. Harmless, but disabling the manpage silences it.
  flake.modules.homeManager.base.manual.manpages.enable = false;
}
