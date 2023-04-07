{
  inputs = { infra = { url = "path:../../"; }; };
  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.zinc =
      nixpkgs.lib.nixosSystem { modules = [ ./configuration.nix ]; };
  };
}
