{ config, lib, inputs, pkgs, ... }:

with lib;
let cfg = config.zen.modules.ricing.durdraw;
in {

  options.zen.modules.ricing.durdraw = { enable = mkEnableOption "heh"; };

  config = mkIf cfg.enable {

    home.packages = [ ./flake.nix ];

  };
}
