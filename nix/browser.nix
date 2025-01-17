{
  lib,
  config,
  ...
}:
{
  options.custom.browser.enable = lib.mkEnableOption "browsers";
  config = lib.mkIf config.custom.browser.enable {
    programs.firefox.enable = true;
  };
}
