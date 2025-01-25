{ config, lib, ... }:
{
options.custom.wallpaper.enable = lib.mkEnableOption "custom hyprpaper config";
config = lib.mkIf config.custom.wallpaper.enable {
 services.hyprpaper = {
  enable = true;
  settings = {
    splash = true;
    splash_offset = 2.0;
    ipc = "on";

/*    preload = config.stylix.image;
    wallpaper = [
      "DP-3,${config.stylix.image}"
   ];*/
  };
};

};
}
