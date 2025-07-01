{ config, lib, pkgs, inputs, ... }:

with lib;
let
  # This is for convenience (see the config block)
  cfg = config.zen.modules.desktop.cava.cava;
in {
  options.zen.modules.desktop.cava.cava = {
    enable = mkEnableOption "Description";

    framerate = mkOption {
      description = "Framerate to use";
      type = types.int;
      default = 90;
    };

    autosens = mkOption {
      description = "Enable autosens?";
      type = types.int;
      default = 0;
    };

    overshoot = mkOption {
      description = "Overshoot amount?";
      type = types.int;
      default = 0;
    };
    # this is where you define the settings you want to be able to configure
  };

  config = mkIf cfg.enable {
    programs.cava = {
      enable = true;
      settings = {
        general.framerate = cfg.framerate;
        autosens = cfg.autosens;
        overshoot = cfg.overshoot;
      };
    };
  };
}
