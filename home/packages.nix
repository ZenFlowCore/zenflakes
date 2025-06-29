{ pkgs, ...}:

with pkgs; 
[
    # >>"Hello, world!" when run.<<
    hello
  
    # >>DEV<<
    zed-editor
    rustup
    tmux
    ghostty
    git
    kitty

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
    unzip
    killall
    tree

    # >>IDK<<
    vesktop
    swaynotificationcenter

    # >>WALLPAPER & CUSTOMIZATION & SCREENUTILS<<
    hyprshot
    grim
    fastfetch
    swww
    spicetify-cli
    slurp
    matugen
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
