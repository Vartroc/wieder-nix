{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.custom.userspace.gaming;
in
{
  options.custom.userspace.gaming.enable = lib.mkEnableOption "gaming";
  config = lib.mkIf cfg.enable {
    programs = {
      steam.enable = true;
      steam.gamescopeSession.enable = true;
      gamemode.enable = true;
    };

    environment.systemPackages = with pkgs; [
      lutris
      heroic
      prismlauncher
      osu-lazer-bin
      protonup
      r2modman
      ryujinx
      tor-browser

      ddnet
      mindustry
      superTux
      superTuxKart
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    # heavy "inspiration" from https://www.youtube.com/watch?v=qlfm3MEbqYA

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
    # hardware.opengl has beed changed to hardware.graphics

    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.enableAllFirmware = true;
    #boot.kernelParams = [ "amdgpu.dpm=1" ];
  };
}
