
{ config, lib, pkgs, inputs, ... }:

with lib;
let
  # This is for convenience (see the config block)
  cfg = config.zen.modules.cli.spicetify;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  options.zen.modules.cli.spicetify = {
    enable = mkEnableOption "Spicetify";
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      shuffle
      groupSession
      fullAppDisplay
    ];
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ]; 
  };
  
  config = mkIf cfg.enable {};
}
