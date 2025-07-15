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

      templates = {
        yazi = {
          input_path = "${./templates/yazi-colors.toml}";
          output_path = "../../terminal/yazi/yazi-colors.toml";
        };
        cava = {
          input_path = "${./templates/cava-colors}";
          output_path = "../../desktop/music/cava/themes/cava-colors";
        };
        quickshell = {
          input_path = "${./templates/quickshell-colors.js}";
          output_path = "../../../../config/quickshell/colors.js";
        };
        /* spicetify = {
             input_path = "${./templates/spicetify-colors.ini}";
             output_path = "/spicetify-colors.ini";
           };
        */
        oh-my-posh = {
          input_path = "${./templates/oh-my-posh.toml}";
          output_path = "../../terminal/oh-my-posh/theme.toml";
        };
        foot = {
          input_path = "${./templates/foot-colors.ini}";
          output_path = "../../terminal/foot/themes/foot-colors.ini";
        };
        kitty = {
          input_path = "${./templates/kitty-colors.conf}";
          output_path = "../../terminal/kitty/current-theme.conf";
        };
      };

    };
  };
}
