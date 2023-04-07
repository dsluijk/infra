{
  inputs = {
    nixpkgs = { url = "nixpkgs/nixos-unstable"; };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware = { url = "path:./hardware"; };
    install = { url = "path:./install"; };
  };
  outputs =
    { self, nixpkgs, nixos-generators, hardware, install, ... }@inputs: {
      nixosConfigurations = {
        zinc = nixpkgs.lib.nixosSystem { modules = [ install.zinc ]; };
      };

      packages = {
        inherit hardware install;

        "x86_64-linux" = {
          zinc = nixos-generators.nixosGenerate {
            format = "install-iso";
            modules = [ install.zinc ];
          };
        };
      };
    };
}
