{ pkgs, ... }:

with pkgs; [
  # >>"Hello, world!" when run.<<
  hello

  # >>DEV<<
  rustup
  ghostty
  gcc
  nodejs
  vue
  yarn
  bun
  vscode
  lua-language-server
  rust-analyzer
  gnome-clocks

  # >>MUSIC<<
  easyeffects
  cava

  # >>NAVIGATION<<
  fzf
  ulauncher
  zoxide
  yazi
  wofi
  eza
  nautilus

  # >>SYSTEM UTILITIES<<
  wget
  mission-center
  auto-cpufreq
  btop
  unzip
  killall
  tree
  bat
  gnome-software

  # >>IDK<<
  equibop
  swaynotificationcenter
  inkscape

  # >>WALLPAPER & CUSTOMIZATION & SCREENUTILS<<
  hyprshot
  grim
  fastfetch
  swww
  slurp
  matugen
  clock-rs
  gpu-screen-recorder

  # >>QUICKSHILL<<
  qt6Packages.qt5compat
  libsForQt5.qt5.qtgraphicaleffects
  kdePackages.qtbase
  kdePackages.qtdeclarative

  # >>FISH<<
  fishPlugins.done
  fishPlugins.fzf-fish
  fishPlugins.forgit
  fishPlugins.hydro
  fishPlugins.grc
  fish
  grc
  flat-remix-gtk
]
