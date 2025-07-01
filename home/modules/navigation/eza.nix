{ config, lib, pkgs, inputs, ... }:

with lib;
let
  # This is for convenience (see the config block)
  cfg = config.zen.modules.navigation.eza;
in {
  options.zen.modules.navigation.eza = {
    enable = mkEnableOption "Description";

  };

  config = mkIf cfg.enable { };
}
