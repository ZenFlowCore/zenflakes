{ pkgs, inputs, config, lib, ... }:
with lib;
let cfg = config.zen.modules.terminal.kitty.kitty;
in {
  options.zen.modules.terminal.kitty.kitty = {
    enable = mkEnableOption "To enable or not to enable";

  };
  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      font.name = "JetBrainsMono Nerd Font Mono";
      font.size = 13;
      enableGitIntegration = true;
      settings = {
        allow_remote_control = true;
        window_padding_width = 13;
        confirm_os_window_close = 0;
      };
    };
  };
}
