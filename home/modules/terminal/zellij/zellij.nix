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

        themes.zen = {
          fg = "#D8DEE9";
          bg = "#2E3440";
          black = "#3B4252";
          red = "#BF616A";
          green = "#A3BE8C";
          yellow = "#EBCB8B";
          blue = "#81A1C1";
          magenta = "#B48EAD";
          cyan = "#88C0D0";
          white = "#E5E9F0";
          orange = "#D08770";
        };
      };
    };
  };
}
