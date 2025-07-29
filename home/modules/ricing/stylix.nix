{ lib, config, pkgs, inputs, ... }:
with lib;
let cfg = config.zen.modules.ricing.stylix;
in {
  options.zen.modules.ricing.stylix = {
    enable = mkEnableOption "to enable, or not to enable";
  };

  imports = [ inputs.stylix.homeModules.stylix ];

  config = mkIf cfg.enable {
    stylix = {
      base16Scheme = ./themes/ayu-dark.yaml;
      enable = true;
      polarity = "dark";
      image = ./Wallpapers/_star_wars.jpg;

      cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };
      fonts = {
        sansSerif = {
          package = pkgs.nerd-fonts.zed-mono;
          name = "ZedMono Nerd Font";
        };
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Mono";
        };
        sizes = {
          popups = 10;
          applications = 10;
          terminal = 12;
          desktop = 10;
        };
      };
      opacity = {
        terminal = 0.85;
        desktop = 0.85;
      };
    };
  };
}
