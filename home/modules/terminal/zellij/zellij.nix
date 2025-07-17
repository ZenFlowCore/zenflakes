{ config, lib, pkgs, inputs, ... }:

with lib;
let
  # This is for convenience (see the config block)
  cfg = config.zen.modules.terminal.zellij.zellij;
in {
  options.zen.modules.terminal.zellij.zellij = {
    enable = mkEnableOption "Description";
  };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      settings = {
        theme = "zen";
        default_shell = "fish";
        show_startup_tips = false;
        show_release_notes = false;

        simplified_ui = true;
        default_layout = "compact";

        themes.zen = {
          fg = "#D8DEE9";
          bg = "#141414";
          black = "#0a0a0a";
          red = "#ef476f";
          green = "#83d483";
          yellow = "#ffd166";
          blue = "#118ab2";
          magenta = "#6a4c93";
          cyan = "#0cb0a9";
          white = "#E5E9F0";
          orange = "#f78c6b";
        };
      };
    };
  };
}
