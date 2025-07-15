{ config, lib, pkgs, inputs, ... }:

with lib;
let
  # This is for convenience (see the config block)
  cfg = config.zen.modules.terminal.zellij;
in {
  options.zen.modules.terminal.zellij = {
    enable = mkEnableOption "Description";
  };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;



   };
  };
}
