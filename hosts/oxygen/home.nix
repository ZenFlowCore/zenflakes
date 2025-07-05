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
    desktop.music.youtube-music.enable = true;
    desktop.common.cursor.cursor = {
      enable = true;
      name = "Volantes";
      size = 20;
    };
    cli.spicetify.enable = false;
    terminal.tmux.enable = true;
    terminal.kitty.kitty.enable = true;
    terminal.oh-my-posh.oh-my-posh.enable = true;

  };

  programs.home-manager.enable = true;
}
