{
  config,
  pkgs,
  lib,
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
        pkgs.nh
        pkgs.ripgrep
        pkgs.tree
        pkgs.bat
        pkgs.fzf
        pkgs.nixfmt-rfc-style
        pkgs.fastfetch
      ];
    };
    programs.fish.enable = true;
  };
}
