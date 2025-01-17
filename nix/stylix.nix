{ pkgs, config, lib, ... }:
{
options.custom.stylix.enable = lib.mkEnableOption "the stylix theming suite";
config = lib.mkIf config.custom.stylix.enable {
 stylix = { 
  enable = true;

  base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml"; 
  image = ../hm/files/wallpapers/current.png;

  cursor = {
    package = pkgs.volantes-cursors;
    name = "volantes_cursors";
    size = 32;
  };

/*  fonts = {
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
