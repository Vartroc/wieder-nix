{ lib, config, ... }:
{
  options = {
    custom.sound.enable = lib.mkEnableOption "sound-support";
  };
  config = lib.mkIf config.custom.sound.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
