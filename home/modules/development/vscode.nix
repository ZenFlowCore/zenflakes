{ config, lib, inputs, pkgs, ... }:

with lib;
let cfg = config.zen.modules.development.vscode;
in
{
	options.zen.modules.development.vscode = {
		enable = mkEnableOption "TO ENABLE OR NOT TO ENABLE";
	};

	config = mkIf cfg.enable {


		programs.vscode = {
			enable = true;

			mutableExtensionsDir = true;
		};
	}

}
