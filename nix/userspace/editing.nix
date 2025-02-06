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
    ];
  };
}
