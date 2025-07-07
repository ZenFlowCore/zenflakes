{ pkgs, inputs, config, lib, ... }:
with lib;
let cfg = config.zen.modules.terminal.foot.foot;
in {
  options.zen.modules.terminal.foot.foot = {
    enable = mkEnableOption "To enable or not to enable";

  };
  config = mkIf cfg.enable {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          title = foot;
          shell = fish;
          pad = "15x15";
          bold-text-in-bright = no;
          font = "JetBrainsMono Nerd Font Mono:size=12";
          colors = {
            alpha = 0.8;
            background = 131314;
          };
        };
        scollback.lines = 10000;
      };
    };
  };
}
