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
    environment.systemPackages = [
      pkgs.signal-desktop
      pkgs.dolphin
      pkgs.vesktop

      pkgs.spotify
      pkgs.spicetify-cli
    ];
  };
}
