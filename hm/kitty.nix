{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.custom.kitty.enable = lib.mkEnableOption "my custom config for the kitty terminal";
  config = lib.mkIf config.custom.kitty.enable {

    #    home.packages = with pkgs; [ kitty ];
    programs.kitty = {
      enable = true;
      package = pkgs.kitty;
      settings = {
        window_border_width = "0px";
        tab_bar_edge = "top";
        tab_bar_margin_width = "0.0";
        tab_bar_style = "fade";
        placement_strategy = "top-left";
        hide_window_decorations = true;
        background_opacity = lib.mkForce 0.95;
        font_size = lib.mkForce 15;
      };
      shellIntegration.enableFishIntegration = true;
    };
  };
}
