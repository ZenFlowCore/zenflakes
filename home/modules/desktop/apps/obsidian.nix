{ pkgs, config, inputs, lib, ... }:

with lib;
let cfg = config.zen.modules.desktop.apps.obsidian;
in {
  options.zen.modules.desktop.apps.obsidian = {
    enable = mkEnableOption "To Enable or not to enable";
  };

  config = mkIf cfg.enable { programs.obsidian = { enable = true; }; };
}
