{ config, lib, pkgs, inputs, ... }:

with lib;
let
  # This is for convenience (see the config block)
  cfg = config.zen.modules.terminal.tmux;
in {
  options.zen.modules.terminal.tmux = {
    enable = mkEnableOption "Description";
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      disableConfirmationPrompt = true;
      clock24 = true;
      baseIndex = 1;
      plugins = with pkgs; [
        tmuxPlugins.cpu
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
          '';
        }
      ];
      extraConfig = ''
        # Theme: borders
        set -g pane-border-lines single
        set -g pane-border-style fg=brightblack
        set -g pane-active-border-style fg=red

        # Theme: status
        set -g status-style bg=default,fg=brightblack
        set -g status-left "#[fg=brightblack,bright]#(basename \"#{pane_current_path}\")"
        set -g status-right "#[fg=brightblack,bright]#S"

        # Theme: status (windows)
        set -g window-status-format "●"
        set -g window-status-current-format "●"
        set -g window-status-current-style "#{?window_zoomed_flag,fg=yellow,fg=red,nobold}"
        set -g window-status-bell-style "fg=red,nobold"
        set -g status-justify absolute-centre

        # Keybinds
        set -g prefix C-+
        bind r source-file ~/.tmux.conf \; display-message "Config reloaded"
        set -g @plugin 'tmux-plugins/tpm'
      '';

      prefix = ''C-" "'';
      resizeAmount = 3;
    };
  };
}
