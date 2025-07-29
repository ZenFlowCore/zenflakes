{ lib, config, pkgs, inputs, ... }:
with lib;
let cfg = config.zen.modules.ricing.stylix;
in {
  options.zen.modules.ricing.stylix = {
    enable = mkEnableOption "to enable, or not to enable";
  };

  imports = [ inputs.stylix.homeManager.stylix ];

  config = mkIf cfg.enable { stylix = { enable = true; }; };
}
