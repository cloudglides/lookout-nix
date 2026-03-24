{
  description = "Lookout packaged for Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    packages.${system}.default = pkgs.callPackage ./default.nix {};

    apps.${system}.default = {
      type = "app";
      program = "${self.packages.${system}.default}/bin/lookout";
    };
  };
}
