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
    inputs.matugen.nixosModules.default
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
    desktop.apps.obsidian.enable = true;
    development.vscode.enable = true;
    development.zed-editor.enable = false;
    navigation.yazi.enable = true;
    terminal.tmux.tmux.enable = true;
    terminal.foot.foot.enable = true;
    terminal.kitty.kitty.enable = true;
    terminal.helix.helix.enable = true;
    terminal.zellij.zellij.enable = true;
    terminal.oh-my-posh.oh-my-posh.enable = true;
    ricing.stylix.enable = true;

  };

  programs.home-manager.enable = true;
}
