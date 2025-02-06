{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.custom.userspace.socialize;
in
{
  options.custom.userspace.socialize.enable = lib.mkEnableOption "socialize";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      signal-desktop
      vesktop
    ];
  };
}
