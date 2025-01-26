{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  options.custom.terminal.enable = lib.mkEnableOption "terminal utilities";

  config = lib.mkIf config.custom.terminal.enable {
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
      ];
    };
  };
}
