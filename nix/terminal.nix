{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  options.custom.ghostty.enable = lib.mkEnableOption "the ghostty terminal emulator";

  config = lib.mkIf config.custom.ghostty.enable {
    environment = {
      sessionVariables = {
        FLAKE = "/home/andi/wieder-nix";
      };
      systemPackages = [
        inputs.ghostty.packages.x86_64-linux.default
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
