{ lib, config, pkgs, inputs, ... }:
with lib;
let
  cfg = config.zen.modules.ricing.stylix;
  currentPolarity = config.programs.matugen.variant;
  matugenTheme = if currentPolarity == "dark" then
    config.programs.matugen.theme.colors.dark
  else
    config.programs.matugen.theme.colors.light;
in {
  options.zen.modules.ricing.stylix = {
    enable = mkEnableOption "to enable, or not to enable";
  };

  imports = [ inputs.stylix.homeModules.stylix ./matugen/matugen.nix ];

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      polarity = currentPolarity;
      image = wallpapers/malenia.jpg;

      # heavily modified but inspo from https://github.com/make-42/stylix/blob/matugen-clean-diff-rebuild/stylix/palette.nix
      override = with matugenTheme; {
        base00 = background;
        base01 = surface_container;
        base02 = surface_bright;
        base03 = outline;
        base05 = on_surface;
        base07 = on_primary_container;
        base0E = primary;
      };
      cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 36;
      };
      fonts = {
        sansSerif = {
          package = pkgs.nerd-fonts.fira-code;
          name = "FiraCode Nerd Font";
        };
        monospace = {
          package = pkgs.nerd-fonts.fira-code;
          name = "FiraCode Nerd Font Mono";
        };
        sizes = {
          popups = 13;
          applications = 13;
          terminal = 13;
          desktop = 14;
        };
      };
      opacity = {
        terminal = 0.85;
        desktop = 0.85;
      };
    };
  };
}
