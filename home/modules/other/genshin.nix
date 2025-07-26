# configuration.nix
{ config, pkgs, inputs, lib, ... }:
with lib;
let
  aagl = import (builtins.fetchTarball
    "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz");
  cfg = config.zen.modules.other.genshin;
in {

  options.zen.modules.other.genshin = {
    enable = mkEnableOption "To Enable or Not To Enable";
  };

  config =
    mkIf cfg.enable { programs.anime-game-launcher = { enable = true; }; };
}
