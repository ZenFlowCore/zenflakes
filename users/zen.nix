{ pkgs, config, sources, lib, ... }:
let
  username = "zen";
  description = "To zen or not to Zen";
in {
  zen.data.users = [ username ];
  users.users.${username} = {
    inherit description;

    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "multimedia" ];

  };

  # define secrets
  age.secrets.rexiesPass = {
    file = ../secrets/secret1.age;
    owner = username;
  };

  # hjem
  hjem.users.${username} = {
    enable = true;
    user = username;
    directory = config.users.users.${username}.home;
    clobberFiles = lib.mkForce true;

    files = let
      matugen = config.programs.matugen;
      matugenTheme = matugen.theme.files;

      qt6ct = let
        from = [ "/home/zen" ];
        to = [ "${config.users.users.${username}.home}" ];
      in builtins.replaceStrings from to
      (builtins.readFile ./dots/qt6ct/qt6ct.conf);

    in {

      # fish
      ".config/fish/themes".source = sources.rosep-fish + "/themes";
      ".config/fish/config.fish".source = ./dots/fish/config.fish;

      # bat
      ".config/bat/config".source = ./dots/bat/config;
      ".config/bat/themes".source = sources.catp-bat + "/themes";

      # foot terminal
      ".config/foot/foot.ini".source = ./dots/foot/foot.ini;

      # hyprland
      ".config/yazi/yazi.toml".source = ./dots/yazi/yazi.toml;
      ".config/yazi/keymap.toml".source = ./dots/yazi/keymap.toml;
      ".config/yazi/theme.toml".source = "${matugenTheme}/yazi-theme.toml";

      # quickshell
      ".config/quickshell".source = "../zenflow";
      # qt6ct
      ".config/qt6ct/qt6ct.conf".text = qt6ct;
      ".config/qt6ct/colors/matugen.conf".source =
        "${matugenTheme}/qtct-colors.conf";

      # discord
      ".config/equibopq/themes/midnight.css".source =
        "${matugenTheme}/discord-midnight.css";
    };
  };
}

