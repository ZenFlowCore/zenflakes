# you may leverage the following command to build systems using this
# sudo nixos-rebuild --no-reexec --file ./default.nix -A <hostName> <boot|test|switch|...>

{ config }:
let

  inherit (config.networking) hostName;
  pkgs = import ./home/packages.nix { inherit pkgs; };

  nixosConfig = hostName:
    import (pkgs) {
      system = "x86_64-linux";
      modules =
        [ ./hosts/${hostName}/configuration.nix ./users/zen.nix ./home ];
    };
in { oxygen = nixosConfig "oxygen"; }
