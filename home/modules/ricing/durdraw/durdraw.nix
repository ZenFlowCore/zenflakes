{ config, lib, inputs, pkgs, ... }:
with lib;
let
  cfg = config.zen.modules.ricing.durdraw.durdraw;

  durdraw = let
    python = pkgs.python3;
    pythonPackages = python.pkgs;
    projectData = builtins.fromTOML (builtins.readFile ./pyproject.toml);
  in pythonPackages.buildPythonApplication {
    pname = projectData.project.name;
    version = projectData.project.version;
    src = ./.;
    pyproject = true;
    nativeBuildInputs = [ pythonPackages.setuptools pythonPackages.wheel ];
    buildInputs = [ pkgs.neofetch pkgs.ansilove ];
    doCheck = false;
  };
in {
  options.zen.modules.ricing.durdraw.durdraw = {
    enable = mkEnableOption "Enable durdraw ASCII art editor";
  };

  config = mkIf cfg.enable { home.packages = [ durdraw ]; };
}
