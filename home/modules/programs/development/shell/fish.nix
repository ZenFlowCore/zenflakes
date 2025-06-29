{ config, pkgs, ...}:

{
  
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if status is-interactive
        # Commands to run in interactive sessions can go here
      end

      export OBSIDIAN_USE_WAYLAND=1
      export PATH="$PATH:/usr/lib/qt6/bin"
      set -x PATH  "$HOME/.local/bin" $PATH
      zoxide init fish | source
      oh-my-posh init fish --config /home/zen/.config/ompsh/theme.toml | source

      function fish_greeting 
        # arise, REMEMBER WHO YOU ARE! >>he did not say that<<
      end

      abbr --add cnix sudo nvim ~/zenflakes/hosts/default/configuration.nix
      abbr --add upgrd sudo nixos-rebuild switch --flake ~/zenflakes/#default
      abbr --add c clear
      abbr --add clr clear
      abbr --add ff fastfetch
      abbr --add v nvim
      abbr --add ls exa --oneline --reverse --sort=type
      abbr --add srcy z src
    '';
  };
}

