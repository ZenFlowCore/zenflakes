{ config, lib, pkgs, inputs, ... }:

with lib;
let
  # This is for convenience (see the config block)
  cfg = config.zen.modules.terminal.zellij.zellij;
in {
  options.zen.modules.terminal.zellij.zellij = {
    enable = mkEnableOption "Description";
  };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      settings = {
        theme = "zen";
        default_shell = "fish";
        show_startup_tips = false;
        show_release_notes = false;

        simplified_ui = true;
        default_layout = "compact";

        layouts = "zen";

        dev = {
          layout = {
            _children = [
              {
                default_tab_template = {
                  _children = [
                    {
                      pane = {
                        size = 1;
                        borderless = true;
                        plugin = { location = "zellij:tab-bar"; };
                      };
                    }
                    { "children" = { }; }
                    {
                      pane = {
                        size = 2;
                        borderless = true;
                        plugin = { location = "zellij:status-bar"; };
                      };
                    }
                  ];
                };
              }
              {
                tab = {
                  _props = {
                    name = "Project";
                    focus = true;
                  };
                  _children = [{ pane = { command = "nvim"; }; }];
                };
              }
              {
                tab = {
                  _props = { name = "Git"; };
                  _children = [{ pane = { command = "lazygit"; }; }];
                };
              }
              {
                tab = {
                  _props = { name = "Files"; };
                  _children = [{ pane = { command = "yazi"; }; }];
                };
              }
              {
                tab = {
                  _props = { name = "Shell"; };
                  _children = [{ pane = { command = "zsh"; }; }];
                };
              }
            ];
          };
        };

        themes.zen = {
          fg = "#D8DEE9";
          bg = "#141414";
          black = "#0a0a0a";
          red = "#ef476f";
          green = "#006fff";
          yellow = "#f2cc8f";
          blue = "#118ab2";
          magenta = "#ff2090";
          cyan = "#0cb0a9";
          white = "#E5E9F0";
          orange = "#f78c6b";
        };
      };
    };
  };
}
