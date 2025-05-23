{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.custom.userspace.stylix;
in
{
  options.custom.userspace.stylix.enable = lib.mkEnableOption "stylix";
  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;

      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
      image = ../../assets/images/wallpapers/a-rank-party.png;
      polarity = "dark";

      cursor = {
        package = pkgs.volantes-cursors;
        name = "volantes_cursors";
        size = 32;
      };

      /*
        fonts = {
          monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font Mono";
          };
          sansSerif = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font Mono";
          };
          serif = {
            package = pkgs.merriweather;
            name = "merriweather";
          };
        };
      */

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.fira-code;
          name = "FiraCodeNerdFontMono";
        };
        sansSerif = {
          package = pkgs.nerd-fonts.fira-code;
          name = "FiraCodeNerdFont";
        };
        serif = {
          package = pkgs.fira-code;
          name = "FiraCodeNerdFontPropo";
        };
      };

    };
  };
}
