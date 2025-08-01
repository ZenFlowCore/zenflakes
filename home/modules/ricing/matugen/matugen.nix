{ inputs, config, pkgs, ... }: {
  imports = [ inputs.matugen.nixosModules.default ];
  programs.matugen = {
    enable = true;

    variant = "dark";
    package = pkgs.matugen;
  };

  home-manager.extraSpecialArgs = {
    matugenTheme = config.programs.matugen.theme.files;
  };
}
