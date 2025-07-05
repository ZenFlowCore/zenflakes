{ config, lib, pkgs, inputs, ... }:

with lib;
let cfg = config.zen.modules.desktop.quickshell;
in {
  options.zen.modules.desktop.quickshell = {
    enable = mkEnableOption "Quickshell configuration";
  };

  config = mkIf cfg.enable {
    home.packages = [
      inputs.quickshell.packages."${pkgs.system}".default
      pkgs.qt6.qtdeclarative
      pkgs.qt6.qtmultimedia
    ];
    qt.enable = true;

    programs.matugen = {
      enablee = true;
      variant = dark;

      config.reload = true;
      config.wallpaper = {
        command = "swww";
        arguments = [
          "img"
          "-t"
          "any"
          "--transition-duration"
          "1"
          "--transition-step"
          "255"
          "--transition-fps"
          "90"
        ];
        set = true;
      };

      templates = { };

    };

    xdg.configFile = {
      "quickshell" = {
        source = config.lib.file.mkOutOfStoreSymlink
          "${config.dotfilesPath}/config/quickshell/";
      };
    };
  };

}
