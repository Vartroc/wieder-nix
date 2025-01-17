{ lib, config, ... }:
let
  Mod = "Super";
  Mod1 = "Shift";
  Mod2 = "Ctrl";
  Mod3 = "Tab";
in
{
  options.custom.niri.enable = lib.mkEnableOption "my custom configuration for the niri compositor";
  config = lib.mkIf config.custom.niri.enable {

    programs.niri = {
      settings = {

        # --- make steam work ---
        environment.DISPLAY = ":0";
        spawn-at-startup = [ { command = [ "xwayland-satellite" ]; } ];

        input = {
          warp-mouse-to-focus = true;
          #input.keyboard.xkb.layout = "de";
          keyboard.xkb.layout = "de(bone)";
          power-key-handling.enable = false;

          mouse = {
            enable = true;
            accel-profile = "flat";
            accel-speed = 0.0;
            natural-scroll = false;
            scroll-factor = null;
          };
        };

        outputs."LG Electronics LG ULTRAGEAR 401MAJMFM548" = {
          enable = true;
          mode = null; # infos needed
          scale = 1.0;
          variable-refresh-rate = true;
        };

        cursor = {
          hide-after-inactive-ms = 1000;
          hide-when-typing = true;
          #size = 12;
        };

        layout = {
          # --- make the borders minimal and non-intrusive ---
          focus-ring = {
            enable = false;
          };
          insert-hint = {
            enable = false;
          };
          border = {
            enable = true;
            width = 2;
            active.color = "rgb(203, 166, 247)";
            inactive.color = "rgb(24, 24, 37)";
          };
          struts = {
            bottom = 0;
            top = 0;
            left = 0;
            right = 0;
          };
          gaps = 0;

          # --- ---
          #center-focused-column = "on-overflow";
          default-column-width.proportion = 0.5;

          preset-window-heights = [
            { proportion = 1.0 / 3.0; }
            { proportion = 1.0 / 2.0; }
            {
              proportion = 2.0 / 3.0;
            }
            # { fixed = 1080; }
          ];
        };

        # --- animations lol ---
        animations = {
          enable = true;
          slowdown = 0.75;
        };

        screenshot-path = "~/pictures/scrennshots/%Y-%m-%dT%H:%M:%S.png";
        prefer-no-csd = true;

        binds =
          with config.lib.niri.actions;
          let
            sh = spawn "sh" "-c";
          in
          {
            # --- Actions to do on the upper left home-row ---
            "${Mod}+H".action.spawn = "fuzzel";
            "${Mod}+L".action.spawn = "kitty";
            "${Mod}+M".action.spawn = "firefox";
            "${Mod}+W".action = screenshot-window;
            "${Mod}+${Mod1}+W".action = screenshot-screen;
            "${Mod}+${Mod2}+W".action = screenshot;

            # --- Window Management ---
            ## --- focus ---
            "${Mod}+O".action = focus-column-first;
            "${Mod}+G".action = focus-column-last;
            "${Mod}+B".action = focus-column-left;
            "${Mod}+S".action = focus-column-right;
            "${Mod}+N".action = focus-window-or-workspace-down;
            "${Mod}+R".action = focus-window-or-workspace-up;
            ## --- sizing ---
            "${Mod}+Z".action = set-column-width "33%";
            "${Mod}+Comma".action = set-column-width "50%";
            "${Mod}+Period".action = set-column-width "67%";
            "${Mod}+${Mod1}+Z".action = set-column-width "+10%";
            "${Mod}+${Mod1}+Comma".action = set-column-width "-10%";
            "${Mod}+${Mod1}+Period".action = switch-preset-window-height;

            "${Mod}+Y".action = fullscreen-window;
            "${Mod}+K".action = close-window;
            "${Mod}+C".action = close-window;
            ## --- location ---
            "${Mod}+${Mod1}+B".action = move-column-left;
            "${Mod}+${Mod1}+S".action = move-column-right;
            "${Mod}+${Mod1}+N".action = move-window-down-or-to-workspace-down;
            "${Mod}+${Mod1}+R".action = move-window-up-or-to-workspace-up;
            "${Mod}+${Mod2}+B".action = consume-or-expel-window-left;
            "${Mod}+${Mod2}+S".action = consume-or-expel-window-right;

            # --- coll binds ---
            "${Mod}+P".action =
              sh ''cat ~/wieder-nix/hm/files/text-emojis.txt | fuzzel --dmenu | column -t -s "⇒" -N "EMOJI","DESCRIPTION" -H "DESCRIPTION" | tail +2 | wl-copy -n'';

            # --- debugging ---
            "${Mod}+Shift+J".action = quit;

          };
      };
    };
  };
}
