{
  self,
  system,
  git-hooks,
  formatter,
  prek,
}:
git-hooks.lib.${system}.run {
  src = self;
  package = prek;
  hooks = {
    treefmt = {
      enable = true;
      package = formatter;
    };
    clippy.enable = true;
    clippy.settings.allFeatures = true;
    cargo-check.enable = true;
  };
}
