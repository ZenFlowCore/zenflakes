{ config, pkgs, ... }:

{

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
            if status is-interactive
              # Commands to run in interactive sessions can go here
            end


            export OBSIDIAN_USE_WAYLAND=1
            export PATH="$PATH:/usr/lib/qt6/bin"
            set -x QS_NO_RELOAD_POPUP 1
            set -x PATH  "$HOME/.local/bin" $PATH
            zoxide init fish | source
            oh-my-posh init fish --config /home/zen/.config/ompsh/theme.toml | source

            function fish_greeting 
              # arise, REMEMBER WHO YOU ARE! >>he did not say that<<
            end

            function gp
              git add .
              git commit -m $argv[1]
              git push
            end
            function hm 
            	git add ~/zenflakes/ 
      	git commit -am $argv[1]
      	git push
            	hm home-manager switch --flake ~/zenflakes/
            end


            abbr --add cnix sudo nvim ~/zenflakes/hosts/default/configuration.nix
            abbr --add upgrd sudo nixos-rebuild switch --flake ~/zenflakes/#default
            abbr --add c clear
            abbr --add clr clear
            abbr --add ff fastfetch
            abbr --add v NVIM_APPNAME=astrov nvim
            abbr --add ls exa --oneline --reverse --sort=type
            abbr --add srcy z src
            abbr --add astrov NVIM_APPNAME=astronvim_v5 nvim
            abbr --add kick NVIM_APPNAME=kick nvim
            abbr --add chad NVIM_APPNAME=nvChad nvim
    '';
  };
}
