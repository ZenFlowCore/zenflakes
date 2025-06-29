# >>paths.Root/home/modules/default.nix<<

{ ... }:

{
  imports = [
    ./cli
    ./custom
    ./desktop
    ./development
    ./wellbeing
    ./editors
    ./other
    ./terminal
    ./apps
    ./productivity
    ./programs
    ./shell
  ];
}
