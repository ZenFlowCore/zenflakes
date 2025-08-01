{ config, pkgs, inputs, ... }:

let
  flows = import ../../home/packages.nix { inherit pkgs; };
  matugen = config.programs.matugen;
in {
  home.username = "zen";
  home.homeDirectory = "/home/zen";
  home.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;
  matugenTheme = matugen.theme.files;
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
    ricing.durdraw.durdraw.enable = true;
    ricing.matugen.matugen.enable = true;

  };

  programs.home-manager.enable = true;
}
