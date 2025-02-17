{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.custom.userspace.niri;
in
{
  options.custom.userspace.niri.enable = lib.mkEnableOption "niri";
  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
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
