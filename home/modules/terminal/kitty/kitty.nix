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
      settings = { };
    };
  };
}
