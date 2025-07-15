{ lib, config, pkgs, imports, ... }:

with lib;
let cfg = config.zen.modules.terminal.helix;
in 
{
  
  options.zen.modules.terminal.helix = {
    enable = mkEnableOption "To enable or not to enable";
  };
  
  config = mkIf cfg.enable {
    programs.helix = {
      enable = true;
      languages = {
        language-server.rust-language-server = {
          command = "rust-analyzer";
          args = [];
        };
        language = [{
          name = "rust";
          auto-format = true;
        }];
      };
  };
  };

}

