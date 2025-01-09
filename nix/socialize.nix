{ config, pkgs, lib, ... }:
{
options.custom.socialize.enable = lib.mkEnableOption "apps that are used to socialize, such as signal or vesktop";

config = lib.mkIf config.custom.socialize.enable {
  environment.systemPackages = with pkgs; [
    signal-desktop
    vesktop
  ];
};
}
