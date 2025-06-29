{ config, pkgs, ... }:

let
  gitLibsecret = pkgs.git.override { withLibsecret = true; };
in {
  programs.git = {
    enable = true;
    userName = "wer-zen";
    userEmail = "zenwerden@gmail.com";
    extraConfig = {
      credential.helper = "${gitLibsecret}/bin/git-credential-libsecret";
    };
  };
}

