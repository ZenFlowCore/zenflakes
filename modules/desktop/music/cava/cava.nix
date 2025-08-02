{ config, lib, pkgs, inputs, ... }:

with lib;
let cfg = config.zen.modules.desktop.music.cava.cava;
in {
  options.zen.modules.desktop.music.cava.cava = {
    enable = mkEnableOption "TO ENABLE OR NOT TO ENABLE :fire:";
    settings = {
      framerate = mkOption {
        description = "Framerate to use";
        type = types.int;
        default = 90;
      };

      overshoot = mkOption {
        description = "Overshoot amount?";
        type = types.int;
        default = 0;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.cava = {
      enable = true;
      settings = {
        general.framerate = cfg.settings.framerate;
        general.overshoot = cfg.settings.overshoot;
      };
    };
  };
}
