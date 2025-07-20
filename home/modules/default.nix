# >>paths.Root/home/modules/default.nix<<

{ ... }:

{
  imports = [
    ./cli
    ./custom
    ./desktop
    ./development
    ./wellbeing
    ./other
    ./terminal
    ./productivity
    ./shell
    ./navigation
    ./utilities
    ./ricing
  ];
}
