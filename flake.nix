{
  description = "ZenFlow NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    durdraw.url = "github:cmang/durdraw";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen.url = "github:InioX/Matugen";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, stylix, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      lib = nixpkgs.lib;
    in {
      defaultPackage.${system} = home-manager.defaultPackage.${system};

      nixosConfigurations.oxygen = lib.nixosSystem {
        system = system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/oxygen/configuration.nix
          {

          }
        ];
      };

      homeConfigurations.zen = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/oxygen/home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
