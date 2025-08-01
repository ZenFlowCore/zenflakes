{ lib, inputs, config, pkgs, ... }:
with lib;
let cfg = config.zen.modules.ricing.matugen.matugen;
in {

  options.zen.modules.ricing.matugen.matugen = {
    enable = mkEnableOption "TO ENABLE OR NOT TO ENABLE";
  };

  config = mkIf cfg.enable {
    programs.matugen = {
      enable = true;

      variant = "dark";
      package = pkgs.matugen;
    };

  };

  imports = [ inputs.matugen.nixosModules.default ];

}
