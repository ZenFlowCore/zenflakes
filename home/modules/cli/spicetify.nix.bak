{ config, lib, pkgs, inputs, ... }:

with lib;
let
  # This is for convenience (see the config block)
  cfg = config.zen.modules.cli.spicetify;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  
  # Helper function to get extension packages from string names
  getExtensions = extensionNames:
    map (name: spicePkgs.extensions.${name}) extensionNames;
  
  # Helper function to get custom app packages from string names  
  getCustomApps = appNames:
    map (name: spicePkgs.apps.${name}) appNames;
in
{
  options.zen.modules.cli.spicetify = {
    enable = mkEnableOption "Spicetify";
    extensions = mkOption {
      description = "List of extension names to enable";
      type = lib.types.listOf lib.types.str;
      default = [ "hidePodcasts" "shuffle" "groupSession" "fullAppDisplay" ];
    };
    customApps = mkOption {
      description = "List of custom app names to enable";
      type = lib.types.listOf lib.types.str;
      default = [ "marketplace" ];
    };
  };

  imports = [
      inputs.spicetify-nix.homeManagerModules.default
  ];

  config = mkIf cfg.enable {
    
    programs.spicetify = {
      enable = true;
      enabledExtensions = getExtensions cfg.extensions;
      enabledCustomApps = getCustomApps cfg.customApps;
    };
  };
}
