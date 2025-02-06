{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.custom.userspace.plymouth;
in
{
  options.custom.userspace.plymouth.enable = lib.mkEnableOption "plymouth";
  config = lib.mkIf cfg.enable {
    boot.plymouth = {
      enable = true;
      themePackages = [ pkgs.plymouth-matrix-theme ];
      theme = "matrix";
    };
    stylix.targets.plymouth.enable = false;
  };
}
