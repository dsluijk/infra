{
  inputs = {
    nixpkgs = { url = "nixpkgs/nixos-unstable"; };
    nixos-hardware = { url = "github:NixOS/nixos-hardware/master"; };
  };
  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.zinc =
      nixpkgs.lib.nixosSystem { modules = [ ./configuration.nix ]; };
  };
}
