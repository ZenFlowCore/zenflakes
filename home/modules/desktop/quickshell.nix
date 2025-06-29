{ config, lib, pkgs, inputs, ... }:

with lib;
let
  cfg = config.zen.modules.desktop.quickshell;
in
{
  options.zen.modules.desktop.quickshell = {
    enable = mkEnableOption "Quickshell configuration";
  };

  config = mkIf cfg.enable {
    home.packages = [
      inputs.quickshell.packages."${pkgs.system}".default
      pkgs.qt6.qtdeclarative
    ];
    qt.enable = true;

    xdg.configFile = {
      "quickshell" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/config/quickshell/";
      };
    };
  };
  
}

