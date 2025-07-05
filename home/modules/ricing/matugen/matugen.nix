{ config, lib, pkgs, inputs, ... }:

with lib;
let cfg = config.zen.modules.ricing.matugen;
in {
  options.zen.modules.ricing.matugen = {
    enable = mkEnableOption "To Enable or Not to Enable";
  };

  config = mkIf cfg.enable {
    home.packages = [ inputs.matugen.packages.${system}.default ];

    programs.matugen = {
      enable = true;

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
      "matugen" = {
        source =
          config.lib.file.mkOutOfStoreSymlink "${config.zen}/config/matugen";
      };
    };
  };
}
