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
        theme = "vesper";
        default_shell = "fish";
        show_startup_tips = false;
        show_release_notes = false;

        simplified_ui = true;
        default_layout = "compact";

        ui.pane_frames.hide_session_name = true;

      };
    };
  };
}
