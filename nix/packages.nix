{
  pkgs,
  craneLib,
  commonArgs,
  cargoArtifacts,
}: let
  cargoToml = builtins.fromTOML (builtins.readFile ../Cargo.toml);
  meta = cargoToml.workspace.metadata.crane or cargoToml.package;
  pname = meta.name;
  version = meta.version;
in {
  default = craneLib.buildPackage (commonArgs
    // {
      inherit version cargoArtifacts pname;
      doCheck = false;
    });
}
