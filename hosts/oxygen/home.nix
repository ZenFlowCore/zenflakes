{ config, pkgs, inputs, ... }:

let flows = import ../../home/packages.nix { inherit pkgs; };
in {
  home.username = "zen";
  home.homeDirectory = "/home/zen";
  home.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;

  imports = [
    # Programs!
    ../../home/modules/default.nix
    inputs.spicetify-nix.homeManagerModules.default
  ];
  home.packages = flows;
  services.cliphist = {
    enable = true;
    allowImages = true;
  };
  zen.modules = {
    desktop.quickshell.enable = true;
    desktop.music.cava.cava = {
      enable = true;
      settings = {
        framerate = 90;
        overshoot = -90;
      };
    };
    desktop.common.cursor.cursor = {
      enable = true;
      name = "Volantes";
      size = 20;
    };
    cli.spicetify.enable = true;
    terminal.tmux.enable = true;
  };

  programs.home-manager.enable = true;
}
