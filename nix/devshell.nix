{
  pkgs,
  formatter,
  preCommitCheck ? null,
}: {
  default = pkgs.mkShell {
    packages =
      (with pkgs; [
        just
        cargo-watch
        cargo-nextest
        cargo-expand
      ])
      ++ [formatter]
      ++ pkgs.lib.optionals (preCommitCheck != null) [preCommitCheck];

    shellHook = pkgs.lib.optionalString (preCommitCheck != null) preCommitCheck.shellHook;
  };
}
