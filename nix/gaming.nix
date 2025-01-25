{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    custom.gaming.enable = lib.mkEnableOption "Gaming support";
  };
  config = lib.mkIf config.custom.gaming.enable {
    programs = {
      steam.enable = true;
      steam.gamescopeSession.enable = true;
      gamemode.enable = true;
    };

    environment.systemPackages = with pkgs; [
      lutris
      prismlauncher
      osu-lazer-bin
      protonup
      r2modman

      ddnet
      mindustry
      superTux
      superTuxKart
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    # heavy "inspiration" from https://www.youtube.com/watch?v=qlfm3MEbqYA

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
    # hardware.opengl has beed changed to hardware.graphics

    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.enableAllFirmware = true;
    boot.kernelParams = [ "amdgpu.dmp=1" ];
  };
}
