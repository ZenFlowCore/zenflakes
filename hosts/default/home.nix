{ config, pkgs, inputs, ... }:

{
  home.username = "zen";
  home.homeDirectory = "/home/zen";
  home.stateVersion = "25.05"; 
  nixpkgs.config.allowUnfree = true;

  imports = [ 
    
    

    # Programs!
    ../../modules/programs/spicetify.nix
    ../../modules/programs/git.nix

    # Inputs!
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.packages = with pkgs;[
    # "Hello, world!" when run.
    hello
    gpu-screen-recorder
    rustup
    vesktop
    tmux
    cava
    zed-editor
    libgcc
    yazi
    wget
    fish
    fzf
    eza
    fastfetch
    nautilus
    unzip
    tree
    git
    wofi
    swaynotificationcenter
    kitty
    spicetify-cli
    mission-center
    hyprshot
    slurp
    grim
    swww
    matugen
    ghostty
    zoxide
    killall
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  home.file = {
  };

  home.sessionVariables = {
  # arise
  };
  
  programs.home-manager.enable = true;
}
