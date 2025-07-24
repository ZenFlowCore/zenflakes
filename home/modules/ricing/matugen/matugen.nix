{ config, lib, pkgs, inputs, ... }: {
  imports = [ inputs.matugen.nixosModules.default ];
  programs.matugen = {
    enable = true;
    wallpaper = {
      command = "swww";
      arguments = [
        "img"
        "-t"
        "any"
        "--transition-duration"
        "1"
        "--transition-step"
        "255"
        "--transition-fps"
        "90"
      ];
      set = true;
    };
    templates = {
      yazi = {
        input_path = "./templates/yazi-colors.toml";
        output_path = "~/colors/yazi-colors.toml";
      };
      cava = {
        input_path = "./templates/cava-colors";
        output_path = "~/colors/cava-colors";
      };
      quickshell = {
        input_path = "./templates/quickshell-colors.js";
        output_path = "~/colors/quickshell-colors.js";
      };
      oh-my-posh = {
        input_path = "./templates/oh-my-posh.toml";
        output_path = "~/colors/oh-my-posh-theme.toml";
      };
      foot = {
        input_path = "./templates/foot-colors.ini";
        output_path = "~/colors/foot-colors.ini";
      };
      kitty = {
        input_path = "./templates/kitty-colors.conf";
        output_path = "~/colors/kitty-theme.conf";
      };
    };
  };
}
