{ lib, config, ... }:
let
  cfg = config.custom.misc.no-shutdown;
in
{
  options.custom.misc.no-shutdown.enable = lib.mkEnableOption "disable the shutdown button.";
  config = lib.mkIf cfg.enable {
    services.logind.extraConfig = ''
      # don’t shutdown when power button is short-pressed
      HandlePowerKey=ignore
    '';
  };
}
