{ config, pkgs, inputs, ... }:

let 
  
  packagmes = import ../../home/packages.nix { inherit pkgs; };

in
{
  home.username = "zen";
  home.homeDirectory = "/home/zen";
  home.stateVersion = "25.05"; 
  nixpkgs.config.allowUnfree = true;

  imports = [ 
    
    

    # Programs!
    ../../modules/programs/spicetify.nix
    ../../modules/programs/git.nix
    ../../modules/programs/development/shell/fish.nix
    # Inputs
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.packages = packagmes;
    

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
