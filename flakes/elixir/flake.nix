{
  description =
    "A flake that adds Elixir 1.16.1 with Erlang OTP 26";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = {
          elixir = pkgs.beam.packages.erlang_26.elixir_1_16;
          elixir-ls = pkgs.beam.packages.erlang_26.elixir-ls;
        };
      });
}
