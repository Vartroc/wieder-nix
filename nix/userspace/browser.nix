{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.custom.userspace.browser;
in
{
  options.custom.userspace.browser.enable = lib.mkEnableOption "browser";
  config = lib.mkIf cfg.enable {
    programs.firefox.enable = true;
    environment.systemPackages = [
      pkgs.floorp
    ];
  };
}
