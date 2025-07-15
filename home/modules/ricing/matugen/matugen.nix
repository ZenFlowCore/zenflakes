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
          output_path = "~/yazi-colors.toml";
        };
        cava = {
          input_path = "${./templates/cava-colors}";
          output_path = "~/cava-colors";
        };
        quickshell = {
          input_path = "${./templates/quickshell-colors.js}";
          output_path = "~/quickshell-colors.js";
        };
        spicetify = {
          input_path = "${./templates/spicetify-colors.ini}";
          output_path = "~/spicetify-colors.ini";
        };
        oh-my-posh = {
          input_path = "${./templates/oh-my-posh.toml}";
          output_path = "~/oh-my-posh.toml";
        };
        foot = {
          input_path = "${./templates/foot-colors.ini}";
          output_path = "~/foot-colors.ini";
        };
        kitty = {
          input_path = "${./templates/kitty-colors.conf}";
          output_path = "~/kitty-colors.conf";
        };
      };

    };
  };
}
