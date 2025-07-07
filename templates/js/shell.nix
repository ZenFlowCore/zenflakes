{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {

  buildInputs = with pkgs;
    [
      (with nodePackages; [
        node2nix
        nodejs_24
        bash-language-server
        dockerfile-language-server-nodejs
        eslint
        typescript
        typescript-language-server
      ])
    ];
}
