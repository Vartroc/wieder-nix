{ pkgs, lib, config, ... }:
{
options.custom.plymouth.enable = lib.mkEnableOption "plymouth theming";
config = lib.mkIf config.custom.plymouth.enable {
  boot.plymouth = {
    enable = true;
    themePackages = [ pkgs.plymouth-matrix-theme ];
    theme = "matrix";
  };
  stylix.targets.plymouth.enable = false;
};
}
