{ lib, config, pkgs, ... }:
{
options.custom.niri.enable = lib.mkEnableOption "the niri window manager";
config = lib.mkIf config.custom.niri.enable {
  programs.niri = {
    enable = true;
  };
  programs.xwayland.enable = true;
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    wl-clipboard
    alsa-utils
    xdg-desktop-portal-gtk
    alacritty
  ];

  };
}
