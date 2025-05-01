{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  cfg = config.custom.userspace.terminal;
in
{
  options.custom.userspace.terminal.enable = lib.mkEnableOption "terminal";
  config = lib.mkIf cfg.enable {
    environment = {
      sessionVariables = {
        FLAKE = "/home/andi/wieder-nix";
      };
      systemPackages = [
        pkgs.wev
        pkgs.unzip
        pkgs.zip
        pkgs.curl
        pkgs.gotop
        pkgs.nh
        pkgs.ripgrep
        pkgs.tree
        pkgs.bat
        pkgs.fzf
        pkgs.nixfmt-rfc-style
        pkgs.fastfetch
        pkgs.eza
        pkgs.yt-dlp
        inputs.nimmer.packages."x86_64-linux".default

        pkgs.pavucontrol
      ];
    };
    programs.fish.enable = true;
  };
}
