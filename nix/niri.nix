{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{
  options.custom.niri.enable = lib.mkEnableOption "the niri window manager";
  config = lib.mkIf config.custom.niri.enable {
    programs.niri = {
      enable = true;
      package = pkgs.niri-stable;
    };
    programs.xwayland.enable = true;
    security.polkit.enable = true;

    nixpkgs.overlays = [ inputs.niri.overlays.niri ];

    environment.systemPackages = with pkgs; [
      xwayland-satellite
      wl-clipboard
      alsa-utils
      xdg-desktop-portal-gtk
    ];

  };
}
