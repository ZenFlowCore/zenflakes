{ lib, inputs, config, pkgs, ... }:
with lib;
let cfg = config.zen.modules.ricing.matugen.matugen;
in {
  # Import should be at the top level, outside of the module definition
  imports = [ inputs.matugen.nixosModules.default ];

  options.zen.modules.ricing.matugen.matugen = {
    enable = mkEnableOption "Enable Matugen theming system";
  };

  config = mkIf cfg.enable {
    programs.matugen = {
      enable = true;
      variant = "dark";
      # package = pkgs.matugen; # Remove this line - it's redundant

      # Add your matugen settings here
      custom_colors = {
        red = {
          color = "#FF0000";
          blend = true;
        };
        orange = {
          color = "#FF4F00";
          blend = true;
        };
        green = {
          color = "#00FF00";
          blend = true;
        };
        yellow = {
          color = "#FFFF00";
          blend = true;
        };
        blue = {
          color = "#00AAFF";
          blend = true;
        };
        magenta = {
          color = "#9141ac";
          blend = true;
        };
        cyan = {
          color = "#00FFFF";
          blend = true;
        };
        gray = {
          color = "#333333";
          blend = true;
        };
        pastel_blue = {
          color = "#99c1f1";
          blend = true;
        };
        pastel_orange = {
          color = "#ffa348";
          blend = true;
        };
        white = {
          color = "#FFFFFFFF";
          blend = false;
        };
        pastel_green = {
          color = "#8ff0a4FF";
          blend = true;
        };
        pastel_red = {
          color = "#f66151";
          blend = true;
        };
        pastel_magenta = {
          color = "#dc8add";
          blend = true;
        };
        pastel_mint_green = {
          color = "#93ddc2";
          blend = true;
        };
      };
      templates = {
        hyprland = {
          input_path = "./templates/hyprland-colors.conf";
          output_path = "~/.config/hypr/colors.conf";
        };
        kitty = {
          input_path = "./templates/kitty-colors.conf";
          output_path = "../kitty/themes/colors_dark.conf";
        };
        kitty_light = {
          input_path = "./templates/kitty-colors_light.conf";
          output_path = "../kitty/themes/colors_light.conf";
        };
        oh-my-posh = {
          input_path = "./templates/oh-my-posh.toml";
          output_path = "~/.config/ompsh/theme.toml";
        };
        yazi = {
          input_path = "./templates/yazi-colors.toml";
          output_path = "~/dotfiles/.config/yazi/theme.toml";
        };
        quickshell-colors = {
          input_path = "./templates/quickshell-colors.js";
          output_path = "../quickshell/colors.js";
        };
        quickshell-theme = {
          input_path = "./templates/quickshell-theme.json";
          output_path = "../quickshell/Theme.json";
        };
        svg-colors = {
          input_path = "./templates/svg-colors.svg";
          output_path = "../quickshell/icons/battery/battery-vertical_full.svg";
        };
        cava-colors = {
          input_path = "./templates/cava-colors";
          output_path = "../cava/config";
        };
        foot-colors = {
          input_path = "./templates/foot-colors.ini";
          output_path = "../foot/colors.ini";
        };
      };
    };

    # Link generated theme files to their proper locations
    home.file = {
      # Fix the empty string issue - specify actual file paths
      ".config/gtk-4.0/gtk.css".source =
        "${config.programs.matugen.theme.files}/.config/gtk-4.0/gtk.css";

      # Add other generated files
      ".config/hypr/colors.conf".source =
        "${config.programs.matugen.theme.files}/.config/hypr/colors.conf";
      ".config/kitty/themes/colors_dark.conf".source =
        "${config.programs.matugen.theme.files}/.config/kitty/themes/colors_dark.conf";
      ".config/kitty/themes/colors_light.conf".source =
        "${config.programs.matugen.theme.files}/.config/kitty/themes/colors_light.conf";
      ".config/ompsh/theme.toml".source =
        "${config.programs.matugen.theme.files}/.config/ompsh/theme.toml";
      ".config/yazi/theme.toml".source =
        "${config.programs.matugen.theme.files}/.config/yazi/theme.toml";
      ".config/quickshell/colors.js".source =
        "${config.programs.matugen.theme.files}/.config/quickshell/colors.js";
      ".config/quickshell/Theme.json".source =
        "${config.programs.matugen.theme.files}/.config/quickshell/Theme.json";
      ".config/quickshell/icons/battery/battery-vertical_full.svg".source =
        "${config.programs.matugen.theme.files}/.config/quickshell/icons/battery/battery-vertical_full.svg";
      ".config/cava/config".source =
        "${config.programs.matugen.theme.files}/.config/cava/config";
      ".config/foot/colors.ini".source =
        "${config.programs.matugen.theme.files}/.config/foot/colors.ini";
    };
  };
}
