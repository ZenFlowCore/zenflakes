{ config, lib, pkgs, inputs, ... }:

with lib;
let
  cfg = config.zen.modules.desktop.common.cursor.cursor;

  cursorPackages = {
    "Bibata-Modern-Ice" = pkgs.bibata-cursors;
    "Bibata-Modern-Amber" = pkgs.bibata-cursors;
    "Bibata-Modern-Transparent" = pkgs.bibata-cursors-translucent;
    "Catppuccin-Mocha" = pkgs.catppuccin-cursors.mochaDark;
    "Capitaine" = pkgs.capitaine-cursors;
    "Volantes" = pkgs.volantes-cursors;
    "Material" = pkgs.material-cursors;
    "Adwaita" = pkgs.gnome.adwaita-icon-theme; # fallback/default
  };
in {
  options.zen.modules.desktop.common.cursor.cursor = {
    enable = mkEnableOption "Cursor configuration";

    name = mkOption {
      description = "Name of the cursor theme to use.";
      type = types.str;
      default = "Bibata-Modern-Ice";
    };

    size = mkOption {
      description = "Determines the size of the cursor";
      default = 20;
      type = types.int;
    };
  };

  config = mkIf cfg.enable {
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = cfg.name;
      size = cfg.size;
      package = cursorPackages.${cfg.name} or (throw
        "Unknown cursor theme: ${cfg.name}");
    };
  };
}
