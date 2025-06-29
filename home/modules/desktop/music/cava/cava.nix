{ pkgs, ...}:

{
  programs.cava {
    enable = true;
    settings = { 
      color.theme = "shteme";
    };
  };
}
