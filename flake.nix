{
  description = "Gbait: A GBA Emulator";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    crane.url = "github:ipetkov/crane";

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    fenix,
    flake-utils,
    crane,
    treefmt-nix,
    git-hooks,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [fenix.overlays.default];
      };

      craneLib = crane.mkLib pkgs;

      unfilteredRoot = ./.;
      src = pkgs.lib.fileset.toSource {
        root = unfilteredRoot;
        fileset = craneLib.fileset.commonCargoSources unfilteredRoot;
      };

      commonArgs = {
        inherit src;
        strictDeps = true;
        buildInputs = [];
        nativeBuildInputs = with pkgs; [pkg-config];
      };

      cargoArtifacts = craneLib.buildDepsOnly commonArgs;
      formatter =
        (treefmt-nix.lib.evalModule pkgs
          (import ./nix/treefmt.nix))
        .config.build.wrapper;
    in {
      inherit formatter;

      packages = import ./nix/packages.nix {inherit pkgs craneLib commonArgs cargoArtifacts;};
      checks = import ./nix/checks.nix {inherit craneLib commonArgs cargoArtifacts;};

      devShells = import ./nix/devshell.nix {
        inherit pkgs formatter;

        preCommitCheck = import ./nix/git-hooks.nix {
          inherit self system git-hooks formatter;
          prek = pkgs.prek;
        };
      };
    });
}
