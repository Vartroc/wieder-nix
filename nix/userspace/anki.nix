{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.userspace.anki;
in
{
  options.custom.userspace.anki.enable = lib.mkEnableOption "anki";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.anki-bin
      pkgs.mpv
    ];

  };
}
