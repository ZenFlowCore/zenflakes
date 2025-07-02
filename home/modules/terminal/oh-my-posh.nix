{ config, lib, pkgs, inputs, ... }:

with lib;
let cfg = config.zen.modules.terminal.oh-my-posh;
in {
  options.zen.modules.terminal.oh-my-posh = {
    enable = mkEnableOption "to enable, or not to enable";
    enableFishIntegration = mkOption {
      description = "to fish, or not to fish";
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    programs.oh-my-posh = {
      enable = true;
      enableFishIntegration = cfg.enableFishIntegration;
    };
  };
}
