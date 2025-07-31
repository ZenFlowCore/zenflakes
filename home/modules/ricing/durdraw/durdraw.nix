{ config, lib, inputs, pkgs, ... }:
with lib;
let cfg = config.zen.modules.ricing.durdraw.durdraw;
in {
  options.zen.modules.ricing.durdraw.durdraw = {
    enable = mkEnableOption "Enable durdraw ASCII art editor";
  };
  config = mkIf cfg.enable {
    home.packages = [ inputs.durdraw.${pkgs.system}.default ];
  };
}
