{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.custom.browser.enable = lib.mkEnableOption "browsers";
  config = lib.mkIf config.custom.browser.enable {
    environment.systemPackages = with pkgs; [ firefox ];
  };
}
