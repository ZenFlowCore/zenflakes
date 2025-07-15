{ config, lib, inputs, pkgs, ... }:

with lib;
let cfg = config.zen.modules.development.zed-editor;
in {
  options.zen.modules.development.zed-editor = {
    enable = mkEnableOption "To Enable or not to enable";
  };

  config = mkIf cfg.enable {

    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "astro"
        "basher"
        "fish"
        "java"
        "zig"
        "modest-dark"
        "lua"
        "nu"
        "qml"
      ];

      userSettings = { };
    };

  };
}
