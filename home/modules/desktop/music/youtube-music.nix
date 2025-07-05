{ config, lib, pkgs, inputs, ... }:

with lib;
let cfg = config.zen.modules.desktop.music.youtube-music;
in {
  options.zen.modules.desktop.music.youtube-music = {
    enable = mkEnableOption "TO ENABLE OR NOT TO ENABLE";
  };

  config = mkIf cfg.enable { programs.youtube-music = { enable = true; }; };
}
