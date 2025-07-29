{ inputs, config, pkgs, ... }: {
  imports = [ inputs.matugen.nixosModules.default ];
  programs.matugen = {
    enable = true;
    wallpaper = ../../wallpapers/malenia.jpg;
    variant = "dark";
    package = pkgs.matugen;
  };

  home-manager.extraSpecialArgs = {
    matugenTheme = config.programs.matugen.theme.files;
  };
}
