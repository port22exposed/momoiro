{ pkgs, lib, ... }: let
  packages = pkgs.beam.packagesWith pkgs.beam.interpreters.erlang;

  pname = "momoiro";
  version = "0.0.1";
  src = lib.sources.cleanSource ./.;

  mixFodDeps = packages.fetchMixDeps {
    pname = "mix-deps-${pname}";
    inherit src version;
    hash = lib.fakeHash;
    # mixEnv = ""; # default is "prod", when empty includes all dependencies, such as "dev", "test".
  };

in packages.mixRelease {
  inherit src pname version;
}