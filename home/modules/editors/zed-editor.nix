{pkgs, lib, ... }:

{
    programs.zed-editor = {
        enable = true;

        ## This populates the userSettings "auto_install_extensions"
        extensions = ["nix" "toml" "elixir" "make"];

        ## everything inside of these brackets are Zed options.
        

    };
}

