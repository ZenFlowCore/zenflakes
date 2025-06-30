{ config, lib, pkgs, inputs, ... }:

with lib;
let
  # This is for convenience (see the config block)
  cfg = config.zen.modules.cli.spicetify;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  options.zen.modules.cli.spicetify = { enable = mkEnableOption "Spicetify"; };

  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  config = mkIf cfg.enable {

    programs.spicetify = {
      enable = true;
      spicetifyPackage = pkgs.spicetify-cli;
      spotifyPackage = pkgs.spotify;
      enabledExtensions = with spicePkgs.extensions; [
        hidePodcasts
        shuffle
        groupSession
        fullAppDisplay
      ];
      enabledCustomApps = with spicePkgs.apps; [ marketplace ];
    };
  };
}
