{ lib, config, ... }:
{
  options.custom.no-shutdown.enable = lib.mkEnableOption "disable the shutdown button";

  config = lib.mkIf config.custom.no-shutdown.enable {
    services.logind.extraConfig = ''
      # don’t shutdown when power button is short-pressed
      HandlePowerKey=ignore
    '';
  };
}
