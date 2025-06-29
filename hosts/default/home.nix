{ config, pkgs, inputs, ... }:

let 
  
  flows = import ../../home/packages.nix { inherit pkgs; };

in
{
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
  home.file = {
  };
  home.sessionVariables = {
  # arise
  };
  
  zen = {
    modules = {
      desktop.quickshell.enable = true;    
      desktop.spicetify.enable = true;
      
    };
  };

  programs.home-manager.enable = true;
}
