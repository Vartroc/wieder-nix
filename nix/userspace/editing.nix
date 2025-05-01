{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.userspace.editing;
in
{
  options.custom.userspace.editing.enable = lib.mkEnableOption "editing";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.gimp
      pkgs.obs-studio
      pkgs.openscad-unstable
      pkgs.orca-slicer
      pkgs.kdePackages.dolphin
      pkgs.gparted
    ];
  };
}
